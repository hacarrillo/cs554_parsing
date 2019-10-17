import ply.lex as lex

def makelex():
    reserved = {
        'if' : 'IF', 'then' : 'THEN', 'else' : 'ELSE', 'while' : 'WHILE',
        'true' : 'TRUE', 'false' : 'FALSE', 'not' : 'NOT', 'and' : 'AND', 'or' : 'OR',
        'skip' : 'SKIP', 'fi' : 'FI', 'do' : 'DO', 'od' : 'OD'
    }

    tokens = [
        'INT', 
        'ID', 
        'TIMES', 'MINUS', 'PLUS', 
        'EQUAL', 'LESS', 'GREATER', 'LESSEQUAL', 'GREATEREQUAL', 
        'LINECOMMENT', 'LCOMMENT', 'RCOMMENT',
        'LPAREN', 'RPAREN',
        'ASSIGN', 'SEMICOLON'
    ]

    tokens = tokens + list(reserved.values())

    def t_ID(t):
        r'[a-zA-Z_][a-zA-Z_0-9]*'
        t.type = reserved.get(t.value,'ID')
        return t

    t_TIMES = r'\*'
    t_MINUS = r'-'
    t_PLUS = r'\+'

    t_EQUAL = r'='
    t_LESS = r'<'
    t_GREATER = r'>'
    t_LESSEQUAL = r'<='
    t_GREATEREQUAL = r'>='

    t_LINECOMMENT = r'--'
    t_LCOMMENT = '\{-'
    t_RCOMMENT = '-\}'

    t_LPAREN = r'\('
    t_RPAREN = r'\)'
    t_ASSIGN = r':='
    t_SEMICOLON = r';'

    t_ignore  = ' \t\n'

    def t_INT(t):
        r'\d+'
        t.value = int(t.value)
        return t

     # Error handling rule
    def t_error(t):
        print("Illegal character '%s'" % t.value[0])
        t.lexer.skip(1)

    lexer = lex.lex()
    return lexer

def tokenize(lexer, data):
    lexer.input(data)
    return [tok for tok in lexer]

if __name__ == "__main__":
    lexer = makelex()

    data = '''
    {-
    Computes the factorial of the number stored in x and leaves the result in output
    -}
    whiledo := 10;
    y := x;
    z := 1;
    while y > 1 do
    z := z * y;
    y := y - 1
    od;
    y := 0;
    output := z
    '''

    tokens = tokenize(lexer, data) 
    for tok in tokens:
        print(tok)
