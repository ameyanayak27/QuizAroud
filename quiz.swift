//
//  ViewController.swift
//  QuizAround
//
//  Created by Student on 4/29/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    override func viewDidLoad() {
        super.viewDidLoad()
//        let moc = self.managedObjectContext
//            
//            // Create some dummy data to work with
//            let items = [
//                ("Question1", "easy","movie","a","b","c","d","d"),
//                ("Question2", "medium","movie","a","b","c","d","d"),
//                ("Question3", "hard","movie","a","b","c","d","d"),
//                ("Question4", "easy","tv","a","b","c","d","d"),
//                ("Question5", "medium","tv","a","b","c","d","d"),
//                ("Question6", "hard","tv","a","b","c","d","d"),
//                ("Question7", "easy","cartoon","a","b","c","d","d"),
//                ("Question8", "medium","cartoon","a","b","c","d","d"),
//                ("Question9", "hard","cartoon","a","b","c","d","d")
//            ]
//        
//            // Loop through, creating items
//            for (question, difficulty,section, optiona, optionb, optionc, optiond, answer) in items {
//                // Create an individual item
//                QuizAround.createInManagedObjectContext(moc,question: question, difficulty: difficulty, section:section, optiona: optiona, optionb: optionb, optionc: optionc, optiond: optiond, answer: answer)
//                do {
//                    try moc.save()                    //5
//                   
//                } catch let error as NSError  {
//                    print("Could not save \(error), \(error.userInfo)")
//                }
//            }
//               // Do any additional setup after loading the view, typically from a nib.
//       // let fetchRequest = NSFetchRequest(entityName: "LogItem")
//        
//        // Execute the fetch request, and cast the results to an array of LogItem objects
//        let fetchRequest = NSFetchRequest(entityName: "Quiz")
//        let predicate = NSPredicate(format: "section == %@", "movie")
//        
//        // Set the predicate on the fetch request
//        fetchRequest.predicate = predicate
//        do{
//        if let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as? [QuizAround] {
//            
//            // Create an Alert, and set it's message to whatever the itemText is
//            for (fetchResult) in fetchResults{
//               print(fetchResult.question)
//            }
//            }
//        }
//        catch let error as NSError {
//            // failure
//            print("Fetch failed: \(error.localizedDescription)")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

