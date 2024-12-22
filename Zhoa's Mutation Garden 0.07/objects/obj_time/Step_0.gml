if month = 12 or month = 1 or month = 2 {season = 0}
if month = 3 or month = 4 or month = 5 {season = 1}
if month = 6 or month = 7 or month = 8 {season = 2}
if month = 9 or month = 10 or month = 11 {season = 3}
if (room = rm_menu) exit;	

if obj_world.exploring == false {hour += time_increment;};
 
if hour >= 24
	{
	day += 1
	hour = 0
	if day < 10
		day_string = 0
		else day_string = ""
	if day >= 31
		{
		day_string = 0
		day = 1
		month += 1
		if month >= 13
			{
			month = 1
			year += 1
			}
		}
	}
	
if month = 1 monthname = "January"
if month = 2 monthname = "Febuary"
if month = 3 monthname = "March"
if month = 4 monthname = "April"
if month = 5 monthname = "May"
if month = 6 monthname = "June"
if month = 7 monthname = "July"
if month = 8 monthname = "August"
if month = 9 monthname = "September"
if month = 10 monthname = "October"
if month = 11 monthname = "November"
if month = 12 monthname = "December"