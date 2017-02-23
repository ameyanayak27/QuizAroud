//
//  AboutControllerViewController.swift
//  QuizAround
//
//  Created by Ameya and Salil
//

import UIKit

class AboutControllerViewController: UIViewController {

    
    @IBAction func backToMain()
    {
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("MainScreen")
        self.showViewController(vc as! UIViewController, sender: vc)
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
