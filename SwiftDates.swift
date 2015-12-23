//
//  SwiftDates.swift
//  
//
//  Created by Samhan on 23/12/15.
//
//

import Foundation

import UIKit

extension NSDate
{
    
    class func dateTomorrow() -> NSDate {
        return self.dateWithDaysFromNow(1)
    }
    
    class func dateYesterday() -> NSDate {
        return self.dateWithDaysBeforeNow(1)
    }
    
    class func dateWithDaysFromNow(days: Int) -> NSDate {
        return NSDate().dateByAddingDays(days)
    }
    
    class func dateWithDaysBeforeNow(days: Int) -> NSDate {
        return NSDate().dateBySubtractingDays(days)
    }
    
    class func dateWithHoursFromNow(dHours: Int) -> NSDate {
        return NSDate().dateByAddingHours(dHours)
    }
    
    class func dateWithHoursBeforeNow(dHours: Int) -> NSDate {
        return NSDate().dateBySubtractingHours(dHours)
    }
    
    class func dateWithMinutesFromNow(dMinutes: Int) -> NSDate {
        return NSDate().dateByAddingMinutes(dMinutes)
    }
    
    class func dateWithMinutesBeforeNow(dMinutes: Int) -> NSDate {
        return NSDate().dateBySubtractingMinutes(dMinutes)
    }
    
    func dateByAddingYears(dYears: Int) -> NSDate {
        var dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.year = dYears
        var newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: .WrapComponents)!
        return newDate
    }
    
    func dateBySubtractingYears(dYears: Int) -> NSDate {
        return self.dateByAddingYears(-dYears)
    }
    
    func dateByAddingMonths(dMonths: Int) -> NSDate {
        var dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.month = dMonths
        var newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: .WrapComponents)!
        return newDate
    }
    
    func dateBySubtractingMonths(dMonths: Int) -> NSDate {
        return self.dateByAddingMonths(-dMonths)
    }
    // Courtesy of dedan who mentions issues with Daylight Savings
    
    func dateByAddingDays(dDays: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.day = dDays
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: NSCalendarOptions(rawValue: 0))!
        return newDate
    }
    
    func dateByAddingSeconds(seconds: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.second = seconds
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: NSCalendarOptions(rawValue: 0))!
        return newDate
    }
    
    func dateBySubtractingSeconds(seconds : Int) -> NSDate
    {
        return self.dateByAddingSeconds(seconds * -1)
    }
    
    func dateBySubtractingDays(dDays: Int) -> NSDate {
        return self.dateByAddingDays((dDays * -1))
    }
    
    func dateByAddingHours(dHours: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.hour = dHours
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: NSCalendarOptions(rawValue: 0))!
        return newDate
    }
    
    func dateBySubtractingHours(dHours: Int) -> NSDate {
        return self.dateByAddingHours((dHours * -1))
    }
    
    func dateByAddingMinutes(dMinutes: Int) -> NSDate {
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.minute = dMinutes
        let newDate: NSDate = NSCalendar.currentCalendar().dateByAddingComponents(dateComponents, toDate: self, options: NSCalendarOptions(rawValue: 0))!
        return newDate
    }
    
    func dateBySubtractingMinutes(dMinutes: Int) -> NSDate {
        return self.dateByAddingMinutes((dMinutes * -1))
    }
    
}

extension Int
{
    func daysFromNow()->NSDate
    {
        return NSDate.dateWithDaysFromNow(self)
    }
    
    func daysBeforeNow() -> NSDate
    {
        return NSDate.dateWithDaysBeforeNow(self)
    }
    
    func minutesFromNow()->NSDate
    {
        return NSDate.dateWithMinutesFromNow(self)
    }
    
    func minutesBeforeNow() -> NSDate
    {
        return NSDate.dateWithDaysBeforeNow(self)
    }
    
    func hoursBeforeNow() -> NSDate
    {
        return NSDate.dateWithHoursBeforeNow(self)
    }
    
    func hoursAfterNow() -> NSDate
    {
        return NSDate.dateWithHoursFromNow(self)
    }
    
    func secondsFromNow() -> NSDate
    {
        return NSDate().dateByAddingSeconds(self)
    }
    
    func secondsBeforeNow() -> NSDate
    {
        return NSDate().dateBySubtractingSeconds(self)
    }
    
    func hours() -> NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents()
        components.hour = self
        components.year = 0
        components.minute = 0
        components.second = 0
        components.month = 0
        components.day = 0
        return components
    }
    
    func minutes() -> NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents()
        components.minute = self
        components.hour = 0
        components.year = 0
        components.second = 0
        components.month = 0
        components.day = 0
        
        return components
    }
    
    func seconds() -> NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents()
        components.minute = 0
        components.hour = 0
        components.year = 0
        components.second = self
        components.month = 0
        components.day = 0
        
        return components
    }
    
    func days() -> NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents()
        components.minute = 0
        components.hour = 0
        components.year = 0
        components.second = 0
        components.month = 0
        components.day = self
        return components
    }
    
    func months() -> NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents()
        components.minute = 0
        components.hour = 0
        components.year = 0
        components.second = 0
        components.month = self
        components.day = 0
        return components
    }
    
    func years() -> NSDateComponents
    {
        let components : NSDateComponents = NSDateComponents()
        components.minute = 0
        components.hour = 0
        components.year = self
        components.second = 0
        components.month = 0
        components.day = 0
        return components
    }
    
}


infix operator + { associativity left precedence 140 }
infix operator > { associativity left precedence 130 }
infix operator < { associativity left precedence 130 }
infix operator >= { associativity left precedence 130 }
infix operator <= { associativity left precedence 130 }
infix operator == { associativity left precedence 130 }

func + (let date : NSDate , comp : NSDateComponents)->NSDate
{
    return NSCalendar.currentCalendar().dateByAddingComponents(comp, toDate: date, options: NSCalendarOptions(rawValue: 0))!
}

func + (let compOne : NSDateComponents , compTwo : NSDateComponents)->NSDateComponents
{
    var newComponent = NSDateComponents()
    newComponent.minute = compOne.minute + compTwo.minute
    newComponent.second = compOne.second + compTwo.second
    newComponent.hour = compOne.hour + compTwo.hour
    newComponent.day = compOne.day + compTwo.day
    newComponent.month = compOne.month + compTwo.month
    newComponent.year = compOne.year + compTwo.year
    return newComponent
}

func - (let date : NSDate , comp : NSDateComponents) -> NSDate
{
    let negativeComponent = NSDateComponents()
    negativeComponent.day = comp.day * -1
    negativeComponent.second = comp.second * -1
    negativeComponent.minute = comp.minute * -1
    negativeComponent.month = comp.month * -1
    negativeComponent.year = comp.year * -1
    
    return NSCalendar.currentCalendar().dateByAddingComponents(negativeComponent, toDate: date, options: NSCalendarOptions(rawValue: 0))!
}

func - (let frmDate : NSDate , let toDate : NSDate) -> NSDateComponents
{
    return NSCalendar.currentCalendar().components([.Year,.Month,.Day,.Hour,.Minute,.Second], fromDate: toDate, toDate: frmDate, options: NSCalendarOptions(rawValue:0))
}

func > (let comp : NSDateComponents , let other : NSDateComponents)->Bool
{
    if(comp.year < other.year) {
        return false
    }
    else if(comp.month < other.month) {
        return false
    }
    else if(comp.day < other.day) {
        return false
    }
    else if(comp.hour < other.hour) {
        return false
    }
    else if(comp.minute < other.minute) {
        return false
    }
    else if(comp.second < other.second) {
        return false
    }
    
    return true
}

func < (let comp : NSDateComponents , let other : NSDateComponents)->Bool
{
    if(comp.year > other.year) {
        return false
    }
    else if(comp.month > other.month) {
        return false
    }
    else if(comp.day > other.day) {
        return false
    }
    else if(comp.hour > other.hour) {
        return false
    }
    else if(comp.minute > other.minute) {
        return false
    }
    else if(comp.second > other.second) {
        return false
    }
    
    return true
}

func == (let comp : NSDateComponents , let other : NSDateComponents)->Bool
{
    return comp.year == other.year && comp.month == other.month && comp.day == other.day && comp.hour == other.hour && comp.minute == other.minute && comp.second == other.second
}

func >= (let comp : NSDateComponents , let other : NSDateComponents)->Bool
{
    return comp > other || comp == other
}

func <= (let comp : NSDateComponents , let other : NSDateComponents)->Bool
{
    return comp < other || comp == other
}

