import ply.yacc as yacc
from lexer import *
from collections import OrderedDict
import numpy as np
import os.path
from functools import reduce

def makeparser():
    start = 'command'

    # ---------------- commandands --------------------
    def p_command(p):
        'command : command SEMICOLON newcommand'
        p[0] = [('command',p[1]), ('SEMICOLON', p[0]), ('newcommand', p[3])]

    def p_command_newcommand(p):
        'command : newcommand'
        p[0] = [('newcommand', p[1])]

    def p_newcommand_skip(p):
        'newcommand : SKIP'
        p[0] = [('SKIP', p[1])]

    def p_newcommand_assign(p):
        'newcommand : assignment'
        p[0] = [('assignment', p[1])]

    def p_newcommand_while(p):
        'newcommand : WHILE bool DO command OD'
        p[0] = [('WHILE',p[1]),('bool',p[2]),('DO',p[3]),('command',p[4]),('OD',p[5])]

    def p_newcommand_ifelse(p):
        'newcommand : IF bool THEN command ELSE command FI'
        p[0] = [('IF',p[1]),('bool',p[2]),('THEN',p[3]),('command',p[4]),('ELSE',p[5]),('command',p[6]),('FI',p[7])]

    def p_assignment(p):
        'assignment : ID ASSIGN expression'
        p[0] = [('ID', p[1]),('ASSIGN',p[2]),('expression',p[3])]

    def p_start_empty(p):
        'newcommand : '

    # ---------------- expressions --------------------

    def p_expression_plus(p):
        'expression : expression PLUS term'
        p[0] = [('expression',p[1]),('PLUS',p[2]),('term',p[3])]

    def p_expression_minus(p):
        'expression : expression MINUS term'
        p[0] = [('expression',p[1]),('MINUS',p[2]),('term',p[3])]

    def p_expression_term(p):
        'expression : term'
        p[0] = [('term', p[1])]

    def p_term_times(p):
        'term : term TIMES factor'
        p[0] = [('term',p[1]),('TIMES',p[2]),('factor',p[3])]

    def p_term_factor(p):
        'term : factor'
        p[0] = [('factor', p[1])]

    def p_factor_num(p):
        'factor : INT'
        p[0] = [('INT', p[1])]

    def p_factor_id(p):
        'factor : ID'
        p[0] = [('ID', p[1])]

    def p_factor_pnum(p):
        'factor : PLUS INT'
        p[0] = [('INT',p[2])]

    def p_factor_mnum(p):
        'factor : MINUS INT'
        p[0] = [('INT', -1*p[2])]

    def p_factor_expr(p):
        'factor : LPAREN expression RPAREN'
        p[0] = [('LPAREN',p[1]),('expression',p[2]),('RPAREN',p[3])]

    # ---------------- bool --------------------
    def p_bool_newbool(p):
        'bool : newbool'
        p[0] = [('newbool', p[1])]

    def p_bool_and(p):
        'bool : bool AND newbool'
        p[0] = [('bool',p[1]), ('AND',p[2]), ('newbool',p[3])]

    def p_bool_or(p):
        'bool : bool OR newbool'
        p[0] = [('bool',p[1]), ('OR',p[2]), ('newbool',p[3])]

    def p_newbool_g(p):
        'newbool : expression GREATER expression'
        p[0] = [('expression',p[1]), ('GREATER',p[2]), ('expression',p[3])]

    def p_newbool_l(p):
        'newbool : expression LESS expression'
        p[0] = [('expression',p[1]), ('LESS',p[2]), ('expression',p[3])]

    def p_newbool_ge(p):
        'newbool : expression GREATEREQUAL expression'
        p[0] = [('expression',p[1]), ('GREATEREQUAL',p[2]), ('expression',p[3])]

    def p_newbool_le(p):
        'newbool : expression LESSEQUAL expression'
        p[0] = [('expression',p[1]), ('LESSEQUAL',p[2]), ('expression',p[3])]

    def p_bool_eq(p):
        'newbool : expression EQUAL expression'
        p[0] = [('expression',p[1]), ('EQUAL',p[2]), ('expression',p[3])]

    def p_bool_not(p):
        'newbool : NOT LPAREN bool RPAREN'
        p[0] = [('NOT',p[1]), ('LPAREN',p[2]), ('bool',p[3]), ('RPAREN',p[4])]

    def p_bool_true(p):
        'newbool : TRUE'
        p[0] = [('TRUE', p[1])]

    def p_bool_false(p):
        'newbool : FALSE'
        p[0] = [('FALSE', p[1])]
        
    def p_error(p):
        print("Syntax error in input!")

    # Build the parser
    parser = yacc.yacc()
    return parser

