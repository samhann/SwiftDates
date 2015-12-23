SwiftDates
===================
Custom operators to make your date handling code simple and elegant.

Tomorrows Date :

    1.daysFromNow()

Date Arithmetic :

    var later = NSDate() + 1.hours() + 3.minutes() + 4.minutes() + 3.seconds()
    
    var isGreaterThanOneHourOneMinute =  later - NSDate()  > 1.hours() + 1.minutes() // true

Try it in the playground. 
