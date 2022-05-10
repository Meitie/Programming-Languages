fun is_older ((year1 : int, month1 : int, day1 : int), (year2 : int, month2 : int, day2 : int)) =
    if year1 > year2
        then false
    else 
        if month1 > month2 andalso year1 > year2
            then false
        else   
            if day1 > day2 andalso month1 > month2 andalso year1 > year2
                then false
            else 
                if year1 = year2 andalso month1 = month2 andalso day1 = day2
                    then false
                else true


fun number_in_month (dates : (int * int * int) list, num_month : int) =
    if null dates
        then 0
    else
        let 
            fun total_months (dates : (int * int * int) list, num_month : int, count : int) =
                if #2 (hd dates) = num_month andalso null (tl dates)
                    then count + 1
                else
                    if #2 (hd dates) <> num_month
                    then
                        if null (tl dates)
                        then 
                            count
                        else 
                            total_months((tl dates), num_month, count)
                    else
                        total_months((tl dates), num_month, count + 1)
                            
        in             
            total_months(dates, num_month, 0)
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
        if #2 (hd dates) = (hd months)
            then dates_in_month(dates, (hd months)) @ dates_in_months(tl dates, tl months)
        else
            dates_in_months(tl dates, months)
            

fun get_nth (list_of_strings : string list, position : int) =
    if position = 1
        then (hd list_of_strings)
    else get_nth ((tl list_of_strings), position - 1)


fun date_to_string (year_int : int, month_int : int, day_int : int) =
    let
        val all_the_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        (get_nth(all_the_months, month_int)) ^ " " ^ (Int.toString day_int) ^ ", " ^ (Int.toString year_int)
    end


