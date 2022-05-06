
(* fn was moved into fn below to keep its scoped out of the global, so nothing else uses it.
fun count (from : int, to : int) =
    if from=to
    then to::[]
    else from :: count(from+1, to)
*)

fun countup_from1 (x : int) =
    let
	(* a function that counts from one into to another: int * int -> int list *)
	fun count (from : int) =
	    if from=x
	    then x::[]
	    else from :: count(from+1)
    in
	count(1)
    end
	
