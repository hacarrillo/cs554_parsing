import ply.lex as lex

# specify keywords
reserved = {
'if' : 'IF', 'then' : 'THEN', 'else' : 'ELSE', 'while' : 'WHILE',
'true' : 'TRUE', 'false' : 'FALSE', 'not' : 'NOT', 'and' : 'AND', 'or' : 'OR',
'skip' : 'SKIP', 'fi' : 'FI', 'do' : 'DO', 'od' : 'OD'
}

# tokens that are not keywords
tokens = [
'INT',
'ID',
'TIMES', 'MINUS', 'PLUS',
'EQUAL', 'LESS', 'GREATER', 'LESSEQUAL', 'GREATEREQUAL',
'COMMENT',
'LPAREN', 'RPAREN',
'ASSIGN', 'SEMICOLON',
]

tokens = tokens + list(reserved.values())

def makelex():
    # define an indentifier
    def t_ID(t):
        r'[a-zA-Z_][a-zA-Z_0-9]*'
        t.type = reserved.get(t.value,'ID')
        return t

    # define comments
    def t_COMMENT(t):
        r'(\{-([^-]|[\r\n]|(\-([^\}]|[\r\n])))*-\}|--.*\n)'
        pass

    # simple regular expresions for characters
    t_TIMES = r'\*'
    t_MINUS = r'-'
    t_PLUS = r'\+'
    t_EQUAL = r'='
    t_LESS = r'<'
    t_GREATER = r'>'
    t_LESSEQUAL = r'<='
    t_GREATEREQUAL = r'>='

    t_LPAREN = r'\('
    t_RPAREN = r'\)'
    t_ASSIGN = r':='
    t_SEMICOLON = r';'

    t_ignore  = ' \t\n'

    # how you define an int
    def t_INT(t):
        r'\d+'
        t.value = int(t.value)
        return t

    # no minus or plus, hard D: did it inside the parser

     # Error handling rule
    def t_error(t):
        print("Illegal character '%s'" % t.value[0])
        t.lexer.skip(1)

    # creates lexer obj
    lexer = lex.lex()
    return lexer

def tokenize(lexer, data):
    # gets lexer and data and creates tokens
    lexer.input(data)
    return [tok for tok in lexer]

if __name__ == "__main__":
    lexer = makelex()

    data = '''
    x := 3 - 4 * (5-10);
    y := 2 + 2

    if x > y then y := x + y; else y := y - x; fi
    '''

    data = '''
    {-Computes the -factorial of the number
    stored in x and leaves the result in output-}

    y := x;
    z := 1;

    {- MORE COMMENT -}

    -- line comment
    while := 10 do
    y := x;
    z := -1;
    while y > 1 do
    z := z * y;
    y := y - 1
    od;
    od;
    y := 0;
    output := z
    '''

    code_tokens = tokenize(lexer, data)
    for tok in code_tokens:
        print(tok)
