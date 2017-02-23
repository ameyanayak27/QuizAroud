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
        let moc = self.managedObjectContext
            
            // Create some dummy data to work with
            let items = [
                ("Best Animal", "Dog"),
                ("Best Language","Swift"),
                ("Worst Animal","Cthulu"),
                ("Worst Language","LOLCODE")
            ]
            
            // Loop through, creating items
            for (itemTitle, itemText) in items {
                // Create an individual item
                Quiz.createInManagedObjectContext(moc,question: itemTitle,answer: itemText)
            }
               // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

