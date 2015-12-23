//: SwiftDates - Extensions That Make Swift Dates Easier


import Foundation

1.daysFromNow()

3.hoursAfterNow()

var later = NSDate() + 1.hours() + 3.minutes() + 4.minutes() + 3.seconds()

var isGreaterThanOneHourOneMinute =  later - NSDate()  > 1.hours() + 1.minutes()

var isGreaterThanTwoHour = later - NSDate() > 2.hours()



