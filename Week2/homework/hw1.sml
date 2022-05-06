fun is_older ((year1 : int, month1 : int, day1 : int), (year2 : int, month2 : int, day2 : int)) =
    if year1 > year2
    then false
    else if month1 > month2 andalso year1 > year2
    then false
    else if day1 > day2 andalso month1 > month2 andalso year1 > year2
    then false
    else if year1 = year2 andalso month1 = month2 andalso day1 = day2
    then false
    else true

fun number_in_month (xs : (int * int * int) list, num_month : int) = 
    let
        fun count_tail (xs : (int * int * int) list, num_month : int, counter : int) =
            if null (tl xs) andalso #2 (hd xs) <> num_month
                then counter
            else 
                if #2 (hd xs) = num_month
                    then
                        count_tail(tl xs, num_month, counter + 1)
                else
                    count_tail(tl xs, num_month, counter)
    in
        count_tail(xs, num_month, 0)
    end
