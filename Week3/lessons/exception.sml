fun hd xs =
    case xs of 
        []  => raise List.empty
    |   x::_ => x1


(* how to declare one *)
exception MyUndesireableCondition
exception MyOtherException of int * int (* you can make them hold types *)

fun mydiv (x,y) =
    if y=0
    then raise MyUndesireableCondition
    else x div y


(*you can also pass in exceptions to funs*)
fun maxlist (xs, ex) = (* int list * exn -> int *)
    case xs of
        [] => raise ex
    | x::[] => x
    | x::xs => Int.max(x, maxlist(xs', ex))

val w = maxlist ([3,4,5], MyUndesireableCondition)
val x = maxlist ([3,4,5], MyUndesireableCondition) (* 5 *)
        handle MyUndesireableCondition => 42

(* val y = maxlist ([], MyUndesireableCondition) *)
(* This will raise an exception but since its not handled will cause the run
    time to stop thus its commented out *)

val x = maxlist ([], MyUndesireableCondition)
        handle MyUndesireableCondition => 42        (* 42 *)
e1 handle ex => e2
(* if e1 gets the exception, then handle the exception and put e2 *)