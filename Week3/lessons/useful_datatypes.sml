(* recursive | expression trees *)

datatype exp = Constant of int
            | Negate of exp
            | Add of exp * exp
            | Multiply of exp * exp

Add (Constant (10 + 9), Negate (Constant 4))

fun eval e = 
    case e of 
        Constant i => i
    |   Negate e2 => ~ (eval e2)
    |   Add (e1, e2) => (eval e1) + (eval e2)
    |   Multiply(e1, e2) => (eval e1) * (eval e2)