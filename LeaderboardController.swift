//
//  LeaderboardController.swift
//  QuizAround
//
//  Created by Ameya and Salil
//

import UIKit
import CoreData


class LeaderboardController: UITableViewController {
    var sections = ["tv", "movie", "cartoon","trivia"]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButton()
    {
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("MainScreen")
        self.presentViewController(vc as! UIViewController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LeaderboardCell", forIndexPath: indexPath)
        cell.textLabel?.text = sections[indexPath.row]
        cell.detailTextLabel?.text = ""
        cell.accessoryType = .DisclosureIndicator
        return cell
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var ip = ""
        if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
            let dict = NSDictionary(contentsOfFile: path)
            //get the ip from info.plist
            ip = (dict!.valueForKey("IP") as? String)!
            print(ip)
        }
        let section = sections[indexPath.row]
        let detailVC = LeaderboardDetailTableVC(style : .Plain)
        let urlString = "\(ip)/\(section)"
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(NSURL(string: urlString)!, completionHandler: {(data,response,error) in
         var s = ""
           
            if let response = response as? NSHTTPURLResponse
            {
             s = NSString(data: data!, encoding: NSASCIIStringEncoding) as! String
            }
            else
            {
             s = "SERVER DOWN,The Server is down Contact Later"
            }
            let temp1 = s as String!
            detailVC.responseData = temp1!.componentsSeparatedByString(",")
            dispatch_barrier_async(dispatch_get_main_queue(), {
                self.navigationController?.pushViewController(detailVC, animated: true)
            })
        })
        task.resume()     
        
    }
    
}

