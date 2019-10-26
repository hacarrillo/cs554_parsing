
\chapter{Optimized compiler: uses registers}

\begin{code}
module Main where

import qualified System.Environment
import Data.Char

data Expr = X
          | N Int
          | Plus Expr Expr
          | Minus Expr Expr
          | Times Expr Expr
          | Power Expr Expr
          deriving Eq

e1 :: Expr
e1 = Plus (N 3) (N 4)

e2 :: Expr
e2 = Power (Plus (Minus (Times (Times (N 2) X)(Times (N 2) X)) (N 5)) (N 5)) (Minus (N 2) (N 0))

instance Show Expr where
  show e = case e of
    X              ->  "x"
    N n            ->  show n
    Plus e1 e2     ->  "+(" ++ show e1 ++ "," ++ show e2 ++ ")"
    Minus e1 e2    ->  "-(" ++ show e1 ++ "," ++ show e2 ++ ")"
    Times e1 e2    ->  "*(" ++ show e1 ++ "," ++ show e2 ++ ")"
    Power e1 e2    ->  "**(" ++ show e1 ++ "," ++ show e2 ++ ")"

data Token = TX | TN Int | TPlus | TMinus | TTimes | TPower | TLPar | TRPar | TComma
           deriving (Eq, Show)

scan :: String -> [Token]
scan string = case string of
  ' ':cs       ->  scan cs
  '\t':cs      ->  scan cs
  '\n':cs      ->  scan cs
  'x':cs       ->  TX:scan cs
  '+':cs       ->  TPlus:scan cs
  '-':cs       ->  TMinus:scan cs
  '*':'*':cs   ->  TPower:scan cs
  '*':cs       ->  TTimes:scan cs
  '(':cs       ->  TLPar:scan cs
  ')':cs       ->  TRPar:scan cs
  ',':cs       ->  TComma:scan cs
  d:cs
   | isDigit d ->  scanInt [d] cs
  []           ->  []
  _            ->  error ("scan error: " ++ string)

scanInt :: String -> String -> [Token]
scanInt ds string = case string of
  d:cs
   | isDigit d -> scanInt (d:ds) cs
  c:cs         -> TN (mkInt ds) : scan string
  []           -> [TN (mkInt ds)]
  where
    mkInt ds = read (reverse ds) :: Int


parseExpr :: [Token] -> Maybe (Expr, [Token])
parseExpr ts = case ts of
  TX:ts  ->  Just (X, ts)
  TN n:ts  ->  Just (N n, ts)
  TPlus:TLPar:ts  ->  do
                        (e1, TComma:ts') <- parseExpr ts
                        (e2, TRPar:ts'') <- parseExpr ts'
                        return (Plus e1 e2, ts'')
  TMinus:TLPar:ts  ->  do
                        (e1, TComma:ts') <- parseExpr ts
                        (e2, TRPar:ts'') <- parseExpr ts'
                        return (Minus e1 e2, ts'')
  TTimes:TLPar:ts  ->  do
                        (e1, TComma:ts') <- parseExpr ts
                        (e2, TRPar:ts'') <- parseExpr ts'
                        return (Times e1 e2, ts'')
  TPower:TLPar:ts  ->  do
                        (e1, TComma:ts') <- parseExpr ts
                        (e2, TRPar:ts'') <- parseExpr ts'
                        return (Power e1 e2, ts'')

parse :: [Token] -> Expr
parse ts = case parseExpr ts of
  Just (e, []) -> e
  Just (e, ts') -> error ("parse error: spurious input at end: " ++ show ts')
  Nothing -> error "parse error"

type Meaning = Int -> Int

semantics :: Expr -> Meaning
semantics e = case e of
  X  ->  id
  N n  ->  const n
  Plus e1 e2  ->  \x -> (semantics e1) x + (semantics e2) x
  Minus e1 e2  ->  \x -> (semantics e1) x - (semantics e2) x
  Times e1 e2  ->  \x -> (semantics e1) x * (semantics e2) x
  Power e1 e2  ->  \x -> (semantics e1) x ^ (semantics e2) x

data StackInst = PushConst Int | PushVar | Add | Sub | Mul | Exp
     deriving (Eq, Show)

type Program = [StackInst]

stackCompile :: Expr -> Program // HECTOR: This puts things in the correct processing order. Also, I guess there are many variables, or just one?
stackCompile e = case e of
  X  ->  [PushVar]
  N n  ->  [PushConst n]
  Plus e1 e2  ->  stackCompile e1 ++ stackCompile e2 ++ [Add]
  Minus e1 e2  ->  stackCompile e1 ++ stackCompile e2 ++ [Sub]
  Times e1 e2  ->  stackCompile e1 ++ stackCompile e2 ++ [Mul]
  Power e1 e2  ->  stackCompile e1 ++ stackCompile e2 ++ [Exp]

type Stack = [Int]
type State = (Program, Int, Stack)

run :: State -> State
run ([],v,stack) = ([],v,stack)
run (PushVar:insts,v,stack) = run (insts,v,v:stack)
run (PushConst n:insts,v,stack) = run (insts,v,n:stack)
run (Add:insts,v,n2:n1:stack) = run (insts,v,(n1+n2):stack)
run (Sub:insts,v,n2:n1:stack) = run (insts,v,(n1-n2):stack)
run (Mul:insts,v,n2:n1:stack) = run (insts,v,(n1*n2):stack)
run (Exp:insts,v,n2:n1:stack) = run (insts,v,(n1^n2):stack)

interpret :: Program -> Int -> Int
interpret p i =
  let
    (_,_,[result]) = run (p,i,[])
  in
    result
\end{code}

Next, generate RISC-V assembly that will be accepted by the GNU assembler.

We map the stack to registers. We keep the single argument in a0.

\begin{code}
maxStackHeight :: Program -> Int
maxStackHeight p = maximum (scanl1 (+) (map f p))
  where
    f PushVar = 1
    f (PushConst _) = 1
    f Add = -1
    f Sub = -1
    f Mul = -1

generateOptimizedCodeUsingRegistersToEmulateTheStack :: Program -> IO ()
generateOptimizedCodeUsingRegistersToEmulateTheStack p =
  if maxStackHeight p > stackLimit then error "Program is too complex; need to spill registers"
  else
    do
      mapM_ print (header
                   ++ standardFunctionPrologue
                   ++ [COMMENT ("maxStackHeight=" ++ show (maxStackHeight p))]
                   ++ toOptimizedAssemblyBody p 0
                   ++ standardFunctionEpilogue
                   ++ footer)

data AssemblyItem =
  -- RISCV instructions:
     ADD Reg Reg Reg
   | SUB Reg Reg Reg
   | MUL Reg Reg Reg
   | ADDI Reg Reg Int
   | LD Reg Int Reg
   | SD Reg Int Reg
  -- Assembler pseudoinstructions:
   | MV Reg Reg
   | LI Reg Int
   | JR Reg
  -- Assembler directives:
   | FILE String
   | OPTION String
   | TEXT
   | ALIGN Int
   | GLOBL String
   | TYPE String String
   | LABEL String
   | SIZE String String
   | IDENT String
   | SECTION String
   | COMMENT String

instance Show AssemblyItem where
  show (ADD r1 r2 r3) = "\tadd\t" ++ show r1 ++ "," ++ show r2 ++ "," ++ show r3
  show (SUB r1 r2 r3) = "\tsub\t" ++ show r1 ++ "," ++ show r2 ++ "," ++ show r3
  show (MUL r1 r2 r3) = "\tmul\t" ++ show r1 ++ "," ++ show r2 ++ "," ++ show r3
  show (ADDI r1 r2 n) = "\taddi\t" ++ show r1 ++ "," ++ show r2 ++ "," ++ show n
  show (LI r1 n) = "\tli\t" ++ show r1 ++ "," ++ show n
  show (LD r1 offset r2) = "\tld\t" ++ show r1 ++ "," ++ show offset ++ "(" ++ show r2 ++ ")"
  show (SD r1 offset r2) = "\tsd\t" ++ show r1 ++ "," ++ show offset ++ "(" ++ show r2 ++ ")"
  show (JR r1) = "\tjr\t" ++ show r1
  show (MV r1 r2) = "\tmv\t" ++ show r1 ++ "," ++ show r2
  show (FILE s) = "\t.file\t" ++ show s
  show (OPTION s) = "\t.option\t" ++ s
  show TEXT = "\t.text"
  show (ALIGN n) = "\t.align\t" ++ show n
  show (GLOBL s) = "\t.globl\t" ++ s
  show (TYPE s1 s2) = "\t.type\t" ++ s1 ++ ", @" ++ s2
  show (LABEL s) = s ++ ":"
  show (SIZE s1 s2) = "\t.size\t" ++ s1 ++ ", " ++ s2
  show (IDENT s) = "\t.ident\t" ++ show s
  show (SECTION s) = "\t.section\t" ++ s
  show (COMMENT s) = "\t#" ++ s

data Reg = Reg_a0 | Reg_a1 | Reg_a2 | Reg_a3 | Reg_a4 | Reg_a5
         | Reg_t0 | Reg_t1 | Reg_t2
         | Reg_sp | Reg_s0
         | Reg_ra

instance Show Reg where
  show Reg_a0 = "a0"
  show Reg_a1 = "a1"
  show Reg_a2 = "a2"
  show Reg_a3 = "a3"
  show Reg_a4 = "a4"
  show Reg_a5 = "a5"
  show Reg_t0 = "t0"
  show Reg_t1 = "t1"
  show Reg_t2 = "t2"
  show Reg_sp = "sp"
  show Reg_s0 = "s0"
  show Reg_ra = "ra"

stackLimit = 8

stackMap :: Int -> Reg
stackMap 0 = Reg_a1
stackMap 1 = Reg_a2
stackMap 2 = Reg_a3
stackMap 3 = Reg_a4
stackMap 4 = Reg_a5
stackMap 5 = Reg_t0
stackMap 6 = Reg_t1
stackMap 7 = Reg_t2

// HECTOR: can probably just copy this
header :: [AssemblyItem]
header = [FILE "computation.c",
          OPTION "nopic",
          TEXT,
          ALIGN 1,
          GLOBL "computation",
          TYPE "computation" "function",
          LABEL "computation"]

footer :: [AssemblyItem]
footer = [SIZE "computation" ".-computation",
          IDENT "SimpleArithmeticOptimized.lhs",
          SECTION "note.GNU-stack,\"\",@progbits"]

standardFunctionPrologue :: [AssemblyItem]
standardFunctionPrologue = [ADDI Reg_sp Reg_sp (-48),
                            SD Reg_s0 40 Reg_sp,
                            ADDI Reg_s0 Reg_sp 48]

standardFunctionEpilogue :: [AssemblyItem]
standardFunctionEpilogue = [LD Reg_s0 40 Reg_sp,
                            ADDI Reg_sp Reg_sp 48,
                            JR Reg_ra]

toOptimizedAssemblyBody :: Program -> Int -> [AssemblyItem]
toOptimizedAssemblyBody p stackHeight =
  case p of
    []                  ->  [MV Reg_a0 (stackMap 0)] // HECTOR: this is the end of the program, load answer to return value register. our code should load back to array upon assignment. 
    PushVar:insts       ->  MV (stackMap stackHeight) Reg_a0 // HECTOR: I guess this tells it to load the var from Reg_a0, there is only one variable. Have to change this to read from array...
                            : toOptimizedAssemblyBody insts (stackHeight+1)
    PushConst n:insts   ->  LI (stackMap stackHeight) n
                            : toOptimizedAssemblyBody insts (stackHeight+1)
    Add:insts           ->  ADD (stackMap (stackHeight-2))
                                (stackMap (stackHeight-2))
                                (stackMap (stackHeight-1))
                            : toOptimizedAssemblyBody insts (stackHeight-1)
    Sub:insts           ->  SUB (stackMap (stackHeight-2))
                                (stackMap (stackHeight-2))
                                (stackMap (stackHeight-1))
                            : toOptimizedAssemblyBody insts (stackHeight-1)
    Mul:insts           ->  MUL (stackMap (stackHeight-2))
                                (stackMap (stackHeight-2))
                                (stackMap (stackHeight-1))
                            : toOptimizedAssemblyBody insts (stackHeight-1)

main :: IO ()
main =
  do
    args <- System.Environment.getArgs
    let [sourceFile, argument] = args
    source <- readFile sourceFile
    putStrLn source
    let tokens = scan source
    print tokens
    let e = parse tokens
    print e
    let a = read argument :: Int
    print a
    let meaning = semantics e a
    print meaning
    let code = stackCompile e
    print code
    let interpretation = interpret code a
    print interpretation
    generateOptimizedCodeUsingRegistersToEmulateTheStack code
\end{code}

