//
//  AchievementDetailTableVC.swift
//  QuizAround
//
//  Created by Ameya and Salil
//

import UIKit
import CoreData

class AchievementDetailGroupedTableVC: UITableViewController {
    
    
    var fetchResults = [Achievement]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchResults.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "reuseIdentifier")
        }
        //every cell should have the subtitle style
        if cell != nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                reuseIdentifier: "reuseIdentifier")
        }
        let achievement = fetchResults[indexPath.row]
        cell!.textLabel?.text = "Score:  \(achievement.score!)"
        cell!.detailTextLabel?.text = "Date:  \(achievement.date!)"
        return cell!
    }
    
}

