//
//  SwiftDates.swift
//  
//
//  Created by Samhan on 23/12/15.
//
//

import Foundation

import UIKit


public extension NSDateComponents
{
    static public func zero()->NSDateComponents
    {
        let new = NSDateComponents()
        new.hour = 0
        new.minute = 0
        new.second = 0
        new.day = 0
        new.month = 0
        new.year = 0
        return new
    }
    
    public func componentList()->[Int]
    {
        return [self.year,self.month,self.day,self.hour,self.minute,self.second]
    }
    
    public func unitNames() -> [String]
    {
        return ["year","month","day","hour","minute","second"]
    }
    
    public func componentStrings()->[String]
    {
        let zipped = zip(self.componentList(), self.unitNames())
        let strings : [String] = zipped.map {
            
            return abs($0.0) > 0 ? "\(abs($0.0)) \($0.1)\(self.suffixForVal($0.0))" : ""
            
        }
       
        return strings
    }
    
    public func longString()->String
    {
        var timeString = ""
        
        var strings = self.componentStrings().filter { $0 != ""}
        
        let first =  strings[0..<strings.count-1].joinWithSeparator(" , ")
    
        var second = strings.last!
        
        if(first != "") {
            second = " and "+second
        }
        
        timeString += first + second
        
        return (timeString != "") ? (timeString + " " + self.suffix() ): "Just now"
    }
    
    func shortString()->String
    {
        let first =  self.componentStrings().filter { $0 != ""}.first
        
        if let firstPart = first {
            return firstPart + " "+self.suffix()
        }
        else {
            return "Just now"
        }
    }
    
    
    func isPositive()->Bool
    {
        return self.year < 0 || self.month < 0 || self.day < 0 || self.hour < 0 || self.minute < 0 || self.second < 0
    }
    
    func suffix()->String
    {
        return self.isPositive() ?  "ago" : "from now"
    }

    public func suffixForVal(let val :Int)->String
    {
        return abs(val) > 1 ? "s" : ""
    }
    
    public func before(date : NSDate) -> NSDate
    {
        return date - self
    }

    public func after(date : NSDate) -> NSDate
    {
        return date + self
    }
    
    public func beforeNow() -> NSDate
    {
        return self.before(NSDate())
    }

    public func afterNow() -> NSDate
    {
        return self.after(NSDate())
    }
}

public extension Int
{
    public var hours : NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents.zero()
        components.hour = self
        return components
    }
    
    public var minutes : NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents.zero()
        components.minute = self
        return components
    }
    
    public var seconds : NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents.zero()
        components.second = self
        return components
    }
    
    public var days : NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents.zero()
        components.day = self
        return components
    }
    
    public var months : NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents.zero()
        components.month = self
        return components
    }

    public var weeks : NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents.zero()
        components.day = self*7
        return components
    }

    
    public var years : NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents.zero()
        components.year = self
        return components
    }
    
}

public extension NSDate
{
    
    public class func dateTomorrow() -> NSDate {
        return self.dateWithDaysFromNow(1)
    }
    
    public class func dateYesterday() -> NSDate {
        return self.dateWithDaysBeforeNow(1)
    }
    
    public class func dateWithDaysFromNow(days: Int) -> NSDate {
        return NSDate().dateByAddingDays(days)
    }
    
    public class func dateWithDaysBeforeNow(days: Int) -> NSDate {
        return NSDate().dateBySubtractingDays(days)
    }
    
    public class func dateWithHoursFromNow(dHours: Int) -> NSDate {
        return NSDate().dateByAddingHours(dHours)
    }
    
    public class func dateWithHoursBeforeNow(dHours: Int) -> NSDate {
        return NSDate().dateBySubtractingHours(dHours)
    }
    
    public class func dateWithMinutesFromNow(dMinutes: Int) -> NSDate {
        return NSDate().dateByAddingMinutes(dMinutes)
    }
    
    public class func dateWithMinutesBeforeNow(dMinutes: Int) -> NSDate {
        return NSDate().dateBySubtractingMinutes(dMinutes)
    }
    
    public func dateByAddingYears(dYears: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.year = dYears
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: .WrapComponents)!
        return newDate
    }
    
    public func dateBySubtractingYears(dYears: Int) -> NSDate {
        return self.dateByAddingYears(-dYears)
    }
    
    public func dateByAddingMonths(dMonths: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.month = dMonths
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: .WrapComponents)!
        return newDate
    }
    
    public func dateBySubtractingMonths(dMonths: Int) -> NSDate {
        return self.dateByAddingMonths(-dMonths)
    }
    
   public  func dateByAddingDays(dDays: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.day = dDays
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: NSCalendarOptions(rawValue: 0))!
        return newDate
    }
    
    public func dateByAddingSeconds(seconds: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.second = seconds
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: NSCalendarOptions(rawValue: 0))!
        return newDate
    }
    
    public func dateBySubtractingSeconds(seconds : Int) -> NSDate
    {
        return self.dateByAddingSeconds(seconds * -1)
    }
    
    public func dateBySubtractingDays(dDays: Int) -> NSDate {
        return self.dateByAddingDays((dDays * -1))
    }
    
    public func dateByAddingHours(dHours: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.hour = dHours
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: NSCalendarOptions(rawValue: 0))!
        return newDate
    }
    
    public func dateBySubtractingHours(dHours: Int) -> NSDate {
        return self.dateByAddingHours((dHours * -1))
    }
    
    public func dateByAddingMinutes(dMinutes: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.minute = dMinutes
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: NSCalendarOptions(rawValue: 0))!
        return newDate
    }
    
    public func dateBySubtractingMinutes(dMinutes: Int) -> NSDate {
        return self.dateByAddingMinutes((dMinutes * -1))
    }
    
}

public func + (let date : NSDate , comp : NSDateComponents)->NSDate
{
    return NSCalendar.currentCalendar().dateByAddingComponents(comp, toDate: date, options: NSCalendarOptions(rawValue: 0))!
}

public func - (let date : NSDate , comp : NSDateComponents) -> NSDate
{
    let negativeComponent = NSDateComponents()
    negativeComponent.day = comp.day * -1
    negativeComponent.second = comp.second * -1
    negativeComponent.minute = comp.minute * -1
    negativeComponent.month = comp.month * -1
    negativeComponent.year = comp.year * -1
    
    return NSCalendar.currentCalendar().dateByAddingComponents(negativeComponent, toDate: date, options: NSCalendarOptions(rawValue: 0))!
}


public func + (let compOne : NSDateComponents , compTwo : NSDateComponents)->NSDateComponents
{
    let newComponent = NSDateComponents()
    newComponent.minute = compOne.minute + compTwo.minute
    newComponent.second = compOne.second + compTwo.second
    newComponent.hour = compOne.hour + compTwo.hour
    newComponent.day = compOne.day + compTwo.day
    newComponent.month = compOne.month + compTwo.month
    newComponent.year = compOne.year + compTwo.year
    return newComponent
}


public func - (let frmDate : NSDate , let toDate : NSDate) -> NSDateComponents
{
    return NSCalendar.currentCalendar().components([.Year,.Month,.Day,.Hour,.Minute,.Second], fromDate: toDate, toDate: frmDate, options: NSCalendarOptions(rawValue:0))
}

extension NSDateComponents : Comparable
{
    
}

public func < (let comp : NSDateComponents , let other : NSDateComponents)->Bool
{
    if(abs(comp.year) > abs(other.year)) {
        return false
    }
    else if(abs(comp.month) > abs(other.month)) {
        return false
    }
    else if(abs(comp.day) > abs(other.day)) {
        return false
    }
    else if(abs(comp.hour) > abs(other.hour)) {
        return false
    }
    else if(abs(comp.minute) > abs(other.minute)) {
        return false
    }
    else if(abs(comp.second) > abs(other.second)) {
        return false
    }
    return true
}

public func == (let comp : NSDateComponents , let other : NSDateComponents)->Bool
{
    return comp.year == other.year && comp.month == other.month && comp.day == other.day && comp.hour == other.hour && comp.minute == other.minute && comp.second == other.second
}





