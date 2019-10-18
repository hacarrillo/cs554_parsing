import ply.yacc as yacc
from lexer import *

def makeparser():
    start = 'command'

    # ---------------- commandands --------------------
    def p_command(p):
        'command : command SEMICOLON newcommand'
        p[0] = ('command SEMICOLON newcommand', p[1], p[2], p[3])

    def p_command_newcommand(p):
        'command : newcommand'
        p[0] = ('newcommand', p[1])

    def p_newcommand_skip(p):
        'newcommand : SKIP'
        p[0] = ('SKIP', p[1])

    def p_newcommand_assign(p):
        'newcommand : assignment'
        p[0] = ('assignment', p[1])

    def p_newcommand_while(p):
        'newcommand : WHILE bool DO command OD'
        p[0] = ('WHILE bool DO command OD',p[1],p[2],p[3],p[4],p[5])

    def p_newcommand_ifelse(p):
        'newcommand : IF bool THEN command ELSE command FI'
        p[0] = ('IF bool THEN command ELSE command FI',p[1],p[2],p[3],p[4],p[5],p[6],p[7])

    def p_assignment(p):
        'assignment : ID ASSIGN expression'
        p[0] = ('ID ASSIGN expression', p[1],p[2],p[3])

    def p_start_empty(p):
        'newcommand : '

    # ---------------- expressions --------------------

    def p_expression_plus(p):
        'expression : expression PLUS term'
        p[0] = ('expression PLUS term',p[1],p[2],p[3])

    def p_expression_minus(p):
        'expression : expression MINUS term'
        p[0] = ('expression MINUS term',p[1],p[2],p[3])

    def p_expression_term(p):
        'expression : term'
        p[0] = ('term', p[1])

    def p_term_times(p):
        'term : term TIMES factor'
        p[0] = ('term TIMES factor',p[1],p[2],p[3])

    def p_term_factor(p):
        'term : factor'
        p[0] = ('factor', p[1])

    def p_factor_num(p):
        'factor : INT'
        p[0] = p[1]

    def p_factor_id(p):
        'factor : ID'
        p[0] = ('ID', p[1])

    def p_factor_pnum(p):
        'factor : PLUS INT'
        p[0] = ('PLUS INT', p[2])

    def p_factor_mnum(p):
        'factor : MINUS INT'
        p[0] = ('MINUS INT', -1*p[2])

    def p_factor_expr(p):
        'factor : LPAREN expression RPAREN'
        p[0] = ('LPAREN expression RPAREN',p[1],p[2],p[3])

    # ---------------- bool --------------------
    def p_bool_newbool(p):
        'bool : newbool'
        p[0] = ('newbool', p[1])

    def p_bool_and(p):
        'bool : bool AND newbool'
        p[0] = ('bool AND newbool', p[1], p[2], p[3])

    def p_bool_or(p):
        'bool : bool OR newbool'
        p[0] = ('bool OR newbool', p[1], p[2], p[3])

    def p_newbool_g(p):
        'newbool : expression GREATER expression'
        p[0] = ('expression GREATER expression', p[1], p[2], p[3])

    def p_newbool_l(p):
        'newbool : expression LESS expression'
        p[0] = ('expression LESS expression', p[1], p[2], p[3])

    def p_newbool_ge(p):
        'newbool : expression GREATEREQUAL expression'
        p[0] = ('expression GREATEREQUAL expression', p[1], p[2], p[3])

    def p_newbool_le(p):
        'newbool : expression LESSEQUAL expression'
        p[0] = ('expression LESSEQUAL expression', p[1], p[2], p[3])

    def p_bool_eq(p):
        'newbool : expression EQUAL expression'
        p[0] = ('expression EQUAL expression', p[1], p[2], p[3])

    def p_bool_not(p):
        'newbool : NOT LPAREN bool RPAREN'
        p[0] = ('NOT LPAREN bool RPAREN', p[1], p[2], p[3])

    def p_bool_true(p):
        'newbool : TRUE'
        p[0] = ('TRUE', p[1])

    def p_bool_false(p):
        'newbool : FALSE'
        p[0] = ('FALSE', p[1])
        
    def p_error(p):
        print("Syntax error in input!")

    # Build the parser
    parser = yacc.yacc()
    return parser

if __name__ == "__main__":
    data = '''
    x := 3 - 4 * (5-10);
    y := 2 + 2

    if x > y then y := x + y; else y := y - x; fi
    '''

    data = '''
    if 3 > 4 then y := 3 + 4; else y := 3 - 4; fi
    '''

    data = '''
    {-Computes the -factorial of the number 
    stored in x and leaves the result in output-}

    y := x;
    z := 1;
    
    {- MORE COMMENT -}

    -- line comment
    whiledo := 10;
    y := x;
    z := -1;
    while y > 1 do
    z := z * y;
    y := y - 1
    od;
    y := 0;
    output := z
    '''

    data = '''
    {-
    compute Collatz
    input number is "input"
    output is the number of steps, in "output"
    -}
    n := input;
    steps := 0;
    while n > 1 do
    rem := n; --Here we divide n by 2:
    quot := 0;
    while rem > 1 do
    rem := rem - 2;
    quot := quot + 1
    od;
    if rem = 0 then
    n := quot
    else
    n := 3*n+1
    fi;
    steps := steps + 1
    od;
    output := steps
    '''


    lexer = makelex()
    code_tokens = tokenize(lexer, data)

    parser = makeparser()

    print(data)
    print()
    result = parser.parse(data)
    print(result)
