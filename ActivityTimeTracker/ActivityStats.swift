//
//  ActivityStats.swift
//  ActivityTimeTracker
//
//  Created by Chase Peers on 3/29/16.
//  Copyright © 2016 Chase Peers. All rights reserved.
//

import Foundation

class ActivityStats: NSObject, NSCoding {
    
    /*
     // MARK: Properties
     */
    var activityDates: NSDate
    var timesComplete: Int
    var timesIncomplete: Int
    var timesPartialComplete: Int
    var longestStreak: Int
    var mostRecentStreak: Int
    var averageTime: Double
    var shortestTime: Double
    var longestTime: Double
    var totalTime: Double
    
    
    /*
     // MARK: Initializers
     */
    override init() {
        self.activityDates = NSDate()
        self.timesComplete = 0
        self.timesIncomplete = 0
        self.timesPartialComplete = 0
        self.longestStreak = 0
        self.mostRecentStreak = 0
        self.averageTime = 0
        self.shortestTime = 0
        self.longestTime = 0
        self.totalTime = 0
    }
    
    init(activityDates: NSDate,
         timesComplete: Int,
         timesIncomplete: Int,
         timesPartialComplete: Int,
         longestStreak: Int,
         mostRecentStreak: Int,
         averageTime: Double,
         shortestTime: Double,
         longestTime: Double,
         totalTime: Double) {
        
        self.activityDates = activityDates
        self.timesComplete = timesComplete
        self.timesIncomplete = timesIncomplete
        self.timesPartialComplete = timesPartialComplete
        self.longestStreak = longestStreak
        self.mostRecentStreak = mostRecentStreak
        self.averageTime = averageTime
        self.shortestTime = shortestTime
        self.longestTime = longestTime
        self.totalTime = totalTime
        
        super.init()
        
    }
    
    /*
     // MARK: NSCoding
     */
    
    struct PropertyKey {
        
        static let activityDatesKey = "activityDatesKey"
        static let timesCompleteKey = "timesCompleteKey"
        static let timesIncompleteKey = "timesIncompleteKey"
        static let timesPartialKey = "timesPartialKey"
        static let longestStreakKey = "longestStreakKey"
        static let mostRecentStreakKey = "mostRecentStreakKey"
        static let averageTimeKey = "averageTimeKey"
        static let shortestTimeKey = "shortestTimeKey"
        static let longestTimeKey = "longestTimeKey"
        static let totalTimeKey = "totalTimeKey"
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(activityDates, forKey: PropertyKey.activityDatesKey)
        aCoder.encodeObject(timesComplete, forKey: PropertyKey.timesCompleteKey)
        aCoder.encodeObject(timesIncomplete, forKey: PropertyKey.timesIncompleteKey)
        aCoder.encodeObject(timesPartialComplete, forKey: PropertyKey.timesPartialKey)
        aCoder.encodeObject(longestStreak, forKey: PropertyKey.longestStreakKey)
        aCoder.encodeObject(mostRecentStreak, forKey: PropertyKey.mostRecentStreakKey)
        aCoder.encodeObject(averageTime, forKey: PropertyKey.averageTimeKey)
        aCoder.encodeObject(shortestTime, forKey: PropertyKey.shortestTimeKey)
        aCoder.encodeObject(longestTime, forKey: PropertyKey.longestTimeKey)
        aCoder.encodeObject(totalTime, forKey: PropertyKey.totalTimeKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let activityDates = aDecoder.decodeObjectForKey(PropertyKey.activityDatesKey) as! NSDate
        let timesComplete = aDecoder.decodeObjectForKey(PropertyKey.timesCompleteKey) as! Int
        let timesIncomplete = aDecoder.decodeObjectForKey(PropertyKey.timesIncompleteKey) as! Int
        let timesPartialComplete = aDecoder.decodeObjectForKey(PropertyKey.timesPartialKey) as! Int
        let longestStreak = aDecoder.decodeObjectForKey(PropertyKey.longestStreakKey) as! Int
        let mostRecentStreak = aDecoder.decodeObjectForKey(PropertyKey.mostRecentStreakKey) as! Int
        let averageTime = aDecoder.decodeObjectForKey(PropertyKey.averageTimeKey) as! Double
        let shortestTime = aDecoder.decodeObjectForKey(PropertyKey.shortestTimeKey) as! Double
        let longestTime = aDecoder.decodeObjectForKey(PropertyKey.longestTimeKey) as! Double
        let totalTime = aDecoder.decodeObjectForKey(PropertyKey.totalTimeKey) as! Double
        
        // Must call designated initializer
        self.init(activityDates: activityDates,
                  timesComplete: timesComplete,
                  timesIncomplete: timesIncomplete,
                  timesPartialComplete: timesPartialComplete,
                  longestStreak: longestStreak,
                  mostRecentStreak: mostRecentStreak,
                  averageTime: averageTime,
                  shortestTime: shortestTime,
                  longestTime: longestTime,
                  totalTime: totalTime)
        
    }
    
    /*
     // MARK: Archiving
     */
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("activityStats")
    
}