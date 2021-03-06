type token =
  | AND
  | IF
  | THEN
  | ELSE
  | FN
  | RARROW
  | DOT
  | PLUS
  | MINUS
  | LP
  | RP
  | REC
  | COMMA
  | EOF
  | NUM of (int)
  | ID of (string)

open Parsing;;
let _ = parse_error;;
# 8 "parser.mly"
exception EmptyBinding
exception IncorrectSelection
let whichSel = function (e, 1) -> M.Fst e
			| (e, 2) -> M.Snd e
			| _ -> raise IncorrectSelection
# 28 "parser.ml"
let yytransl_const = [|
  257 (* AND *);
  258 (* IF *);
  259 (* THEN *);
  260 (* ELSE *);
  261 (* FN *);
  262 (* RARROW *);
  263 (* DOT *);
  264 (* PLUS *);
  265 (* MINUS *);
  266 (* LP *);
  267 (* RP *);
  268 (* REC *);
  269 (* COMMA *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  270 (* NUM *);
  271 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\003\000\001\000\001\000\004\000\005\000\002\000\003\000\
\003\000\003\000\003\000\006\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\003\000\004\000\
\014\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\001\000\007\000\000\000\000\000\002\000\000\000\
\000\000\000\000\011\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\013\000\000\000\000\000"

let yydgoto = "\002\000\
\009\000\020\000"

let yysindex = "\255\255\
\120\255\000\000\120\255\243\254\120\255\247\254\000\000\000\000\
\000\000\046\000\064\255\002\255\040\255\250\254\120\255\252\254\
\120\255\120\255\000\000\000\000\120\255\120\255\000\000\120\255\
\008\255\005\255\000\000\005\255\005\255\079\255\109\255\094\255\
\120\255\120\255\000\000\109\255\003\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\001\000\000\000\016\000\031\000\000\000\064\000\000\000\
\000\000\000\000\000\000\075\000\059\000"

let yygindex = "\000\000\
\000\000\002\000"

let yytablesize = 344
let yytable = "\001\000\
\010\000\012\000\010\000\015\000\011\000\014\000\013\000\022\000\
\025\000\027\000\017\000\018\000\005\000\033\000\005\000\008\000\
\026\000\008\000\028\000\029\000\000\000\000\000\030\000\031\000\
\000\000\032\000\000\000\000\000\000\000\000\000\009\000\000\000\
\000\000\000\000\036\000\037\000\000\000\000\000\000\000\000\000\
\015\000\003\000\000\000\000\000\004\000\019\000\016\000\017\000\
\018\000\005\000\023\000\006\000\024\000\007\000\008\000\000\000\
\000\000\000\000\012\000\000\000\000\000\000\000\000\000\005\000\
\015\000\003\000\021\000\000\000\004\000\000\000\016\000\017\000\
\018\000\005\000\006\000\006\000\000\000\007\000\008\000\015\000\
\003\000\000\000\034\000\004\000\000\000\016\000\017\000\018\000\
\005\000\000\000\006\000\000\000\007\000\008\000\015\000\003\000\
\000\000\000\000\004\000\000\000\016\000\017\000\018\000\005\000\
\035\000\006\000\000\000\007\000\008\000\015\000\003\000\000\000\
\000\000\004\000\000\000\016\000\017\000\018\000\005\000\000\000\
\006\000\003\000\007\000\008\000\004\000\000\000\000\000\000\000\
\000\000\005\000\000\000\006\000\000\000\007\000\008\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\010\000\010\000\010\000\010\000\010\000\000\000\010\000\
\010\000\010\000\000\000\010\000\010\000\010\000\010\000\010\000\
\008\000\008\000\008\000\008\000\008\000\000\000\008\000\008\000\
\008\000\000\000\008\000\008\000\008\000\008\000\008\000\009\000\
\009\000\009\000\009\000\009\000\000\000\009\000\009\000\009\000\
\000\000\009\000\009\000\009\000\009\000\009\000\015\000\003\000\
\000\000\000\000\004\000\000\000\016\000\017\000\018\000\005\000\
\000\000\006\000\000\000\007\000\008\000\012\000\012\000\012\000\
\000\000\012\000\005\000\005\000\000\000\012\000\012\000\012\000\
\012\000\000\000\005\000\000\000\005\000\006\000\006\000\000\000\
\000\000\000\000\000\000\000\000\000\000\006\000\000\000\006\000"

let yycheck = "\001\000\
\000\000\015\001\001\000\001\001\003\000\015\001\005\000\006\001\
\015\001\014\001\008\001\009\001\010\001\006\001\010\001\000\000\
\015\000\015\001\017\000\018\000\255\255\255\255\021\000\022\000\
\255\255\024\000\255\255\255\255\255\255\255\255\000\000\255\255\
\255\255\255\255\033\000\034\000\255\255\255\255\255\255\255\255\
\001\001\002\001\255\255\255\255\005\001\000\000\007\001\008\001\
\009\001\010\001\011\001\012\001\013\001\014\001\015\001\255\255\
\255\255\255\255\000\000\255\255\255\255\255\255\255\255\000\000\
\001\001\002\001\003\001\255\255\005\001\255\255\007\001\008\001\
\009\001\010\001\000\000\012\001\255\255\014\001\015\001\001\001\
\002\001\255\255\004\001\005\001\255\255\007\001\008\001\009\001\
\010\001\255\255\012\001\255\255\014\001\015\001\001\001\002\001\
\255\255\255\255\005\001\255\255\007\001\008\001\009\001\010\001\
\011\001\012\001\255\255\014\001\015\001\001\001\002\001\255\255\
\255\255\005\001\255\255\007\001\008\001\009\001\010\001\255\255\
\012\001\002\001\014\001\015\001\005\001\255\255\255\255\255\255\
\255\255\010\001\255\255\012\001\255\255\014\001\015\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\002\001\003\001\004\001\005\001\255\255\007\001\
\008\001\009\001\255\255\011\001\012\001\013\001\014\001\015\001\
\001\001\002\001\003\001\004\001\005\001\255\255\007\001\008\001\
\009\001\255\255\011\001\012\001\013\001\014\001\015\001\001\001\
\002\001\003\001\004\001\005\001\255\255\007\001\008\001\009\001\
\255\255\011\001\012\001\013\001\014\001\015\001\001\001\002\001\
\255\255\255\255\005\001\255\255\007\001\008\001\009\001\010\001\
\255\255\012\001\255\255\014\001\015\001\003\001\004\001\005\001\
\255\255\007\001\003\001\004\001\255\255\011\001\012\001\013\001\
\014\001\255\255\011\001\255\255\013\001\003\001\004\001\255\255\
\255\255\255\255\255\255\255\255\255\255\011\001\255\255\013\001"

let yynames_const = "\
  AND\000\
  IF\000\
  THEN\000\
  ELSE\000\
  FN\000\
  RARROW\000\
  DOT\000\
  PLUS\000\
  MINUS\000\
  LP\000\
  RP\000\
  REC\000\
  COMMA\000\
  EOF\000\
  "

let yynames_block = "\
  NUM\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : M.mexp) in
    Obj.repr(
# 33 "parser.mly"
                  (_1)
# 206 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : M.mexp) in
    Obj.repr(
# 36 "parser.mly"
              (_2)
# 213 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 37 "parser.mly"
          (M.Num _1)
# 220 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 38 "parser.mly"
         (M.Var (_1))
# 227 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : M.mexp) in
    Obj.repr(
# 39 "parser.mly"
                        (M.Fn(_2,_4))
# 235 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : M.mexp) in
    Obj.repr(
# 40 "parser.mly"
                         (M.Rec(_2, _3, _5))
# 244 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : M.mexp) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : M.mexp) in
    Obj.repr(
# 41 "parser.mly"
                          (M.App(_1,_2))
# 252 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : M.mexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : M.mexp) in
    Obj.repr(
# 42 "parser.mly"
                     (M.Add(_1,_3))
# 260 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : M.mexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : M.mexp) in
    Obj.repr(
# 43 "parser.mly"
                   (M.Sub(_1, _3))
# 268 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : M.mexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : M.mexp) in
    Obj.repr(
# 44 "parser.mly"
                    (M.And(_1,_3))
# 276 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : M.mexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 45 "parser.mly"
                   (whichSel (_1,_3))
# 284 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : M.mexp) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : M.mexp) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : M.mexp) in
    Obj.repr(
# 46 "parser.mly"
                                  (M.Ifz(_2,_4,_6))
# 293 "parser.ml"
               : M.mexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : M.mexp) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : M.mexp) in
    Obj.repr(
# 47 "parser.mly"
                         (M.Pair (_2, _4))
# 301 "parser.ml"
               : M.mexp))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : M.mexp)
;;
