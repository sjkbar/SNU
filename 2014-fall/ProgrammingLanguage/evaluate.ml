(*
 * SNU 4190.310 Programming Languages (Fall 2014)
 *
 * Lambda Calculus
 *)

module Evaluator =
  struct
	exception Error of string
 
	let reduce : Lambda.lexp -> Lambda.lexp
	= fun exp -> raise (Error "not implemented")

  end
