val a_pair = (3+1, 4+2)

val a_record = {second = 4+2, first=3+1}

(* This shows that you can give numeric field names to records *)
val another_pair = {2=5, 1=6}

(* #1 a_pair + #2 another_pair; *)

val x = {1=true, 3="hi"}

val y = (3="hi", 1=true, 2 = 3+2)