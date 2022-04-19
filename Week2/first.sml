(* This is a comment. This is our first program. *)

val x = 34;
(* static environment: x is type int *)
(* Dynamic environment: x holds 34 *)

val y = 17; (* type int *)
(* static environment: x is type int *, y has type int) *)
(* Dynamic environment: x holds 34, y holds 17 *)

val z = (x + y) + (y + 2);
(* Dynamic environment: x holds 34, y holds 17, z holds 70 *)

val q = z + 1;
(* Dynamic environment: x holds 34, y holds 17, z holds 70, q = 71 *)


val abs_of_z = if z < 0 then 0 - z else z; (* bool *) (* int *)
(* abs_of_z: int *)
(* dynamic environment: ..., abs_of_z --> 70 *)
(* if (expression) than (true) else (false)  *)

val zbs_of_z_simplifed = abs z; 
