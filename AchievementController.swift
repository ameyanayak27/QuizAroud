//
//  AchievementController.swift
//
//  Created by Ameya and Salil
//

import UIKit
import CoreData


class AchievementController: UITableViewController {
    var sections = ["tv", "movie", "cartoon","trivia"]
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    override func viewDidLoad() {
        super.viewDidLoad()
  
             
    }
    @IBAction func backButton()
    {
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("MainScreen")
        self.presentViewController(vc as! UIViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCellWithIdentifier("AchievementCell", forIndexPath: indexPath)
        
        //Title
        cell.textLabel?.text = sections[indexPath.row]
       
        //Subtitle
        cell.detailTextLabel?.text = ""
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //fetch achievements from core data
        let filter = NSPredicate(format: "section == %@", sections[indexPath.row])
        let request = NSFetchRequest(entityName: "Achievement")
        request.predicate = filter
        let detailVC = AchievementDetailGroupedTableVC(style : .Plain)
        do{
            if let fetchResults = try self.managedObjectContext.executeFetchRequest(request) as? [Achievement] {
                detailVC.fetchResults = fetchResults
            }
        }
        catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        navigationController?.pushViewController(detailVC, animated: true)
    }
}