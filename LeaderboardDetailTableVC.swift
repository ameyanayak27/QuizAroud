//
//  LeaderboardDetailTableVC.swift
//  QuizAround
//
//  Created by Ameya and Salil
//

import UIKit
import CoreData

class LeaderboardDetailTableVC: UITableViewController {
    
    var sections = String?()
    var responseData : [String] = []

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
        return responseData.count / 2
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "reuseIdentifier")
        }
        
        if (cell != nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                reuseIdentifier: "reuseIdentifier")
        }
        
        
        // Configure the cellfetchResults..
        let index = indexPath.row * 2
        var rank = index/2 + 1
       
        cell!.textLabel?.text = "\(rank) \(responseData[index])"

        cell!.detailTextLabel?.text = "Score:  \(responseData[index + 1])"

        return cell!
    }
    
}

