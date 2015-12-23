//: SwiftDates - Extensions That Make Swift Dates Easier


import Foundation

infix operator  + { associativity left precedence 140 }
infix operator > { associativity left precedence 130 }
infix operator < { associativity left precedence 130 }
infix operator >= { associativity left precedence 130 }
infix operator <= { associativity left precedence 130 }
infix operator == { associativity left precedence 130 }


1.daysFromNow()

3.hoursAfterNow()

var later = NSDate() + 1.hours() + 3.minutes() + 4.minutes() + 3.seconds()

var isGreaterThanOneHourOneMinute =  later - NSDate()  > 1.hours() + 1.minutes()

var isGreaterThanTwoHour = later - NSDate() > 2.hours()



