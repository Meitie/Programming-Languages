
fun nondecreasing xs = 
    case xs of
        [] => true
    |   _::[] => true
    | head::(neck::rest) => head <= neck 
                            andalso nondecreasing (neck::rest)

(* fun nondecreasing xs =
    case xs of 
        [] => true
    |   x::xs' => case xs' of
                    [] => true
                | y::ys' => x <= y andalso nondecreasing xs'  *)


datatype sng = P | N | Z

fun multsign (x1, x2) =
    let fun sign x = if x=0 then Z else if x>0 then P else N
    in
        case (sign x1, sign x2) of
            (Z,_) => Z
        |   (_,Z) => Z
        |   (P,P) => P
        |   (N,N) => P
    (*  |   _ =>    N  (* can use this instead to say anything else is N *)  *)
        |   (N,P) => N
        |   (P,N) => N
    end


