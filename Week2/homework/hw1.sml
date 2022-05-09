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

(*  need to rework it  *)
fun number_in_month (dates : (int * int * int) list, num_month : int) =
    if null dates
    then 0
    else
        let
            fun count_tail (dates : (int * int * int) list, counter : int) =
                if null (tl dates) andalso #2 (hd dates) <> num_month
                    then counter
                else
                    if #2 (hd dates) = num_month
                        then
                            if #2 (hd dates) <> num_month
                            then counter
                            else count_tail(tl dates, counter + 1)
                    else
                        count_tail(tl dates, counter)
        in
            count_tail(dates, 0)
        end


fun number_in_months (dates : (int * int * int) list, months : int list) =
    if null dates orelse null months
    then 0
    else
        let
            fun add_months (months : int list, counter : int) =
                if null (tl months)
                then counter + number_in_month(dates, hd months)
                else
                    add_months(tl months, (counter + number_in_month(dates, hd months)) )
        in
            add_months(months, 0)
        end


fun dates_in_month (dates : (int * int * int) list, month : int) =
    if null dates
    then []
    else
        if #2 (hd dates) = month andalso null (tl dates)
        then (hd dates) :: []
        else
            if #2 (hd dates) = month
            then (hd dates) :: dates_in_month(tl dates, month)
            else 
            dates_in_month(tl dates, month)


fun dates_in_months (dates : (int * int * int) list, months : int list) = 
    if null dates orelse null months
    then []
    else 
        if null (tl months)
        then dates_in_month(dates, (hd months))
        else
            if #2 (hd dates) = (hd months)
            then dates_in_month(dates, (hd months)) @ dates_in_months(tl dates, tl months)
            else
                dates_in_months(tl dates, tl months)
            (* dates_in_months(dates, (tl months)) *)
            