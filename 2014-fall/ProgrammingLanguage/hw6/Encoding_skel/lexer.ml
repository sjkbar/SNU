# 7 "lexer.mll"
 
 open Parser
 exception Lex_err of string
 let debug_tag = false
 let verbose s =  if debug_tag then (print_string s; print_newline())
 let comment_depth = ref 0
 let keyword_tbl = Hashtbl.create 31
 let _ = List.iter (fun (keyword, tok) -> Hashtbl.add keyword_tbl keyword tok)
                   [("and", AND);
                    ("ifzero", IF);
                    ("then",THEN);
                    ("else",ELSE);
                    ("fn", FN);
                    ("rec" , REC);
                  ]
 let s2int = function "" -> raise (Lex_err("illegal number token"))
           | s -> if ('~' = String.get s 0) then
                   - (int_of_string(String.sub s 1 ((String.length s)-1)))
                   else int_of_string s

# 23 "lexer.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\241\255\242\255\243\255\245\255\246\255\247\255\000\000\
    \000\000\250\255\084\000\159\000\169\000\002\000\007\000\179\000\
    \249\255\248\255\018\000\250\255\004\000\252\255\253\255\006\000\
    \017\000\255\255\254\255\251\255";
  Lexing.lex_backtrk = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\014\000\
    \011\000\255\255\004\000\014\000\003\000\000\000\000\000\003\000\
    \255\255\255\255\255\255\255\255\005\000\255\255\255\255\005\000\
    \005\000\255\255\255\255\255\255";
  Lexing.lex_default = 
   "\001\000\000\000\000\000\000\000\000\000\000\000\000\000\255\255\
    \255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\000\000\019\000\000\000\255\255\000\000\000\000\255\255\
    \255\255\000\000\000\000\000\000";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\013\000\013\000\013\000\013\000\014\000\027\000\013\000\
    \013\000\013\000\000\000\000\000\013\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\021\000\000\000\000\000\020\000\
    \013\000\000\000\013\000\000\000\000\000\000\000\000\000\013\000\
    \008\000\003\000\016\000\006\000\002\000\005\000\004\000\026\000\
    \012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\024\000\025\000\023\000\007\000\017\000\000\000\
    \000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\000\000\000\000\011\000\000\000\
    \000\000\000\000\000\000\000\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\000\000\
    \000\000\000\000\000\000\010\000\000\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \009\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\022\000\000\000\000\000\000\000\000\000\000\000\
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
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\013\000\013\000\000\000\020\000\013\000\
    \014\000\014\000\255\255\255\255\014\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\018\000\255\255\255\255\018\000\
    \000\000\255\255\013\000\255\255\255\255\255\255\255\255\014\000\
    \000\000\000\000\008\000\000\000\000\000\000\000\000\000\023\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\018\000\024\000\018\000\000\000\007\000\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\010\000\255\255\255\255\000\000\255\255\
    \255\255\255\255\255\255\255\255\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\255\255\
    \255\255\255\255\255\255\010\000\255\255\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\011\000\
    \011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
    \011\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
    \012\000\012\000\012\000\015\000\015\000\015\000\015\000\015\000\
    \015\000\015\000\015\000\015\000\015\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\018\000\255\255\255\255\255\255\255\255\255\255\
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
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec start lexbuf =
    __ocaml_lex_start_rec lexbuf 0
and __ocaml_lex_start_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 33 "lexer.mll"
             ( start lexbuf )
# 173 "lexer.ml"

  | 1 ->
# 34 "lexer.mll"
                  ( start lexbuf)
# 178 "lexer.ml"

  | 2 ->
# 35 "lexer.mll"
                  ( start lexbuf)
# 183 "lexer.ml"

  | 3 ->
# 36 "lexer.mll"
              ( NUM (s2int(Lexing.lexeme lexbuf)) )
# 188 "lexer.ml"

  | 4 ->
# 37 "lexer.mll"
          ( let id = Lexing.lexeme lexbuf
            in try Hashtbl.find keyword_tbl id
               with _ -> ID id
        	)
# 196 "lexer.ml"

  | 5 ->
# 41 "lexer.mll"
           ( verbose "eof"; EOF)
# 201 "lexer.ml"

  | 6 ->
# 42 "lexer.mll"
            ( comment_depth :=1;
              comment lexbuf;
              start lexbuf )
# 208 "lexer.ml"

  | 7 ->
# 45 "lexer.mll"
            ( verbose "=>"; RARROW)
# 213 "lexer.ml"

  | 8 ->
# 46 "lexer.mll"
           (verbose "+"; PLUS)
# 218 "lexer.ml"

  | 9 ->
# 47 "lexer.mll"
        (verbose "-"; MINUS)
# 223 "lexer.ml"

  | 10 ->
# 48 "lexer.mll"
        (verbose "."; DOT)
# 228 "lexer.ml"

  | 11 ->
# 49 "lexer.mll"
           ( verbose "("; LP)
# 233 "lexer.ml"

  | 12 ->
# 50 "lexer.mll"
           ( verbose ")"; RP)
# 238 "lexer.ml"

  | 13 ->
# 51 "lexer.mll"
        (verbose ","; COMMA)
# 243 "lexer.ml"

  | 14 ->
# 52 "lexer.mll"
         (raise (Lex_err("illical token "^(Lexing.lexeme lexbuf))))
# 248 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_start_rec lexbuf __ocaml_lex_state

and comment lexbuf =
    __ocaml_lex_comment_rec lexbuf 18
and __ocaml_lex_comment_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 55 "lexer.mll"
          (comment_depth := !comment_depth+1; comment lexbuf)
# 260 "lexer.ml"

  | 1 ->
# 56 "lexer.mll"
          (comment_depth := !comment_depth-1;
           if !comment_depth > 0 then comment lexbuf )
# 266 "lexer.ml"

  | 2 ->
# 58 "lexer.mll"
         (raise (Lex_err("Eof within comment")))
# 271 "lexer.ml"

  | 3 ->
# 59 "lexer.mll"
          ( comment lexbuf)
# 276 "lexer.ml"

  | 4 ->
# 60 "lexer.mll"
            ( comment lexbuf)
# 281 "lexer.ml"

  | 5 ->
# 61 "lexer.mll"
         (comment lexbuf)
# 286 "lexer.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_comment_rec lexbuf __ocaml_lex_state

;;
