//
//  Activities.swift
//  ActivityTimeTracker
//
//  Created by Chase Peers on 3/29/16.
//  Copyright © 2016 Chase Peers. All rights reserved.
//

import Foundation

class Activities: NSObject, NSCoding {
    
     /*
     // MARK: Properties
     */
    var activityName: String
    var activityTime: NSTimeInterval
    var activityTimeRemaining: NSTimeInterval
    var activityComplete: Bool
    var activityInProgress: Bool
    var currentAngle: Int
    
    /*
     // MARK: Initialization
     */
    override init() {
        self.activityName = "Default"
        self.activityTime = NSTimeInterval()
        self.activityTimeRemaining = NSTimeInterval()
        self.activityComplete = false
        self.activityInProgress = false
	self.currentAngle = 0
    }
    
    init(activityName: String, activityTime: NSTimeInterval) {
        self.activityName = activityName
        self.activityTime = activityTime
        self.activityTimeRemaining = activityTime
        self.activityComplete = false
        self.activityInProgress = false
	self.currentAngle = 0

        super.init()
    }
    
    init(activityName: String, activityTime: NSTimeInterval, activityTimeRemaining: NSTimeInterval, activityComplete: Bool, activityInProgress: Bool, currentAngle: Int) {
        self.activityName = activityName
        self.activityTime = activityTime
        self.activityTimeRemaining = activityTimeRemaining
        self.activityComplete = activityComplete
        self.activityInProgress = activityInProgress
	self.currentAngle = currentAngle
        
        super.init()
    }
    
     /*
     // MARK: NSCoding
     */
    
    struct PropertyKey {
        
        static let nameKey = "nameKey"
        static let timeKey = "timeKey"
        static let timeRemainingKey = "timeRemainingKey"
        static let completeKey = "completeKey"
        static let inProgressKey = "inProgressKey"
	static let angleKey = "angleKey"
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(activityName, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(activityTime, forKey: PropertyKey.timeKey)
        aCoder.encodeObject(activityTimeRemaining, forKey: PropertyKey.timeRemainingKey)
        aCoder.encodeObject(activityComplete, forKey: PropertyKey.completeKey)
        aCoder.encodeObject(activityInProgress, forKey: PropertyKey.inProgressKey)
        aCoder.encodeObject(currentAngle, forKey: PropertyKey.angleKey)
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let activityName = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let activityTime = aDecoder.decodeObjectForKey(PropertyKey.timeKey) as! NSTimeInterval
        let activityTimeRemaining = aDecoder.decodeObjectForKey(PropertyKey.timeRemainingKey) as! NSTimeInterval
        let activityComplete = aDecoder.decodeObjectForKey(PropertyKey.completeKey) as! Bool
        let activityInProgress = aDecoder.decodeObjectForKey(PropertyKey.inProgressKey) as! Bool
        let currentAngle = aDecoder.decodeObjectForKey(PropertyKey.angleKey) as! Int
        
        // Must call designated initializer
        self.init(activityName: activityName, activityTime: activityTime, activityTimeRemaining: activityTimeRemaining, activityComplete: activityComplete, activityInProgress: activityInProgress, currentAngle: currentAngle)
        
    }
    
     /*
     // MARK: Archiving
     */
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("activities")
    
}
