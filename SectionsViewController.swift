//
//  SectionsViewController.swift
//  QuizAround
//
//  Created by Salil and Ameya
// Controller for the sections screen on the Storyboard

import UIKit

class SectionsViewController: UIViewController {

    
    //@IBOutlet weak var tempLabel :UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    //function that passes the section that has been chosen by the user to Quiz Manager to populate the questions.
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        
        let svc = segue!.destinationViewController as! QuizManager
        svc.quizSection = segue.identifier!
        
    }
    //onclick: back button
    
    //action that moves the control back to the main screen.
    @IBAction func goToMain()
    {
    
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("MainScreen")
        self.showViewController(vc as! UIViewController, sender: vc)

    }


}
