//
//  ViewController.swift
//  ActivityTimeTracker
//
//  Created by Chase Peers on 3/26/16.
//  Copyright © 2016 Chase Peers. All rights reserved.
//

import UIKit

class ActivityTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var activities = [Activities]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let testActivity = Activities(activityName: "Test", activityTime: NSTimeInterval())
        
        activities.append(testActivity)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
    
    }
    
    func test() {
        
        let testActivity = Activities()
        
        activities.append(testActivity)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("number of activities")
        print(activities)
        
        let checkActivities = activities.count
        
        if checkActivities > 0 {
            return activities.count
        } else {
            return 0
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ActivityCell"
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ActivityTableCell
        
        let activity = activities[indexPath.row]
        
        cell.activityName.text = activity.activityName
        //cell.activityProgress = activity.activityTimeRemaining
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    
    
    

}

