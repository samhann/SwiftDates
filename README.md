SwiftDates
===================
Custom operators to make your date handling code simple and elegant.

Tomorrows Date :

    1.days.afterNow()

Date Arithmetic :

    var later = NSDate() + 1.hours + 3.minutes + 4.minutes + 3.seconds
    
    var isGreaterThanOneHourOneMinute =  later - NSDate()  > 1.hours + 1.minutes // true


Conversions to duration String:

    (NSDate() - later).longString() // "1 hour , 7 minutes and 2 seconds ago"

    (later - NSDate()).shortString() // "1 hour from now"


Try it in the playground. 


