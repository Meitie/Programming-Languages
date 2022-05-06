(* takes in a list of ints, and adds them all together returns an int: [3,2,2] = 7 *)
fun sum_list(xs: int list) =
    if null xs
    then 0
    else hd xs + sum_list(tl xs) (* int list -> int *)

(* takes a int list, and returns an int multiplied all together: [3,2,2] = 12 *)			 
fun list_product(xs :int list) =
    if null xs
    then 1
    else hd xs * list_product(tl xs) (* int list -> int *)

(* takes an int, and returns a list counting down from that 1 int: (5) = [5,4,3,2,1]*)			     
fun countdown (x : int) =
    if x=0
    then []
    else x :: countdown(x-1)

(* adds one list to another list, first head at a time, then rest: ([2,1],[3,4]) = ([2,1,3,4])*)		       
fun append (xs : int list, ys : int list) =
    if null xs
    then ys
    else (hd xs) :: append ((tl xs), ys)

		
(*functions over pairs of list:  [(3,4), (5,6)]) = 18 *)
fun sum_pair_list (xs : (int * int) list) =
    if null xs
    then 0
    else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs)


fun firsts ( xs : (int * int) list ) = (* get back [3,5] from list above *)
    if null xs
    then []
    else (#1 (hd xs)) :: firsts( tl xs )

fun seconds ( xs : (int * int) list ) = (* get back [4,6] from list above *)
    if null xs
    then []
    else (#2 (hd xs)) :: seconds( tl xs )

				
(* does the same as previous some pairs, but uses other functions *)
fun sum_pair_list2 (xs : (int * int) list) =
    (sum_list(firsts xs)) + (sum_list(seconds xs))

(* calcs the factorial of a given number, using the list_product and countdown functions *)				
fun factorial (n: int) = list_product (countdown n)
