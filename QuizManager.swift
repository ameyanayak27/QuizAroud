//
//  QuizManager.swift
//  QuizAround
//
//  Created by Ameya and Salil

// Code to send email Courtesy : Andrew Bancroft 
//link:https://www.andrewcbancroft.com/2014/08/25/send-email-in-app-using-mfmailcomposeviewcontroller-with-swift/

//Class that manages a session of  each Quiz. THe section viewcontroller passes control here passing the section chosen.
//Controller for the quiz manager view controller on the story board.

import UIKit
import CoreData
import MessageUI

class QuizManager: UIViewController, MFMailComposeViewControllerDelegate {
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    var quizQuestionList:QuizQuestions!
    
    var correctAnswer = ""
    var score = 0
    var count = 0
    var questionLevel = 0
    var levelCount = 0
    var wrongCount = 0
    var quizSection: String = ""
    var seconds = 0
    var timer = NSTimer()
    var timerFlag = false
    var fiftyFlag = false
    var flipFlag = false
    var qPopulate = QuizPopulate(section:"tv" , moc: (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext)
    
    @IBOutlet weak var questionLabel :UILabel!
    @IBOutlet weak var pointsLabel:UILabel!
    
    @IBOutlet weak var option1B:UIButton!
    @IBOutlet weak var option2B:UIButton!
    @IBOutlet weak var option3B:UIButton!
    @IBOutlet weak var option4B:UIButton!
    @IBOutlet weak var nextButtion:UIButton!
    @IBOutlet weak var fiftFityButton:UIButton!
    @IBOutlet weak var flipQuestionButton:UIButton!
    @IBOutlet weak var timerLabel:UILabel!
    
    

    //method that fetches a question randomly based on the level(easy,medium,hard)
    //method is used by populate question method to get random question based on level
    func getQuestion(diffLevel :Int )-> Question?
    {
        do
        {
        
        if diffLevel == 1
        {
            let q = Int(arc4random_uniform(UInt32(quizQuestionList.medQ.count - 1)))
            let nextQ = quizQuestionList.easyQ[q]
            quizQuestionList.easyQ.removeAtIndex(q)
            
            return nextQ
        }
        else
        if diffLevel == 2
        {
            let q = Int(arc4random_uniform(UInt32(quizQuestionList.medQ.count - 1)))
            let nextQ = quizQuestionList.medQ[q]
            quizQuestionList.medQ.removeAtIndex(q)
//            let nextQ = quizQuestionList.medQ.first
//            quizQuestionList.medQ.removeFirst()
            return nextQ
        }
        else
        {
//            let nextQ = quizQuestionList.hardQ.first
//            quizQuestionList.hardQ.removeFirst()
            let q = Int(arc4random_uniform(UInt32(quizQuestionList.hardQ.count - 1)))
            let nextQ = quizQuestionList.hardQ[q]
            quizQuestionList.hardQ.removeAtIndex(q)
            return nextQ
        }
        }
        catch
        {
            if let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist") {
                let myArray = NSMutableArray(contentsOfFile: path)! as Array
                let t = Int(arc4random_uniform(UInt32(15)))
                let dict = myArray[t]
                var defaultQuestion = Question()
                    //print(dict.value)
                    defaultQuestion.question = dict["question"]! as! String
                    defaultQuestion.correctAnswer = dict["answer"]! as! String
                    defaultQuestion.option1 = dict["optiona"]! as! String
                    defaultQuestion.option2 = dict["optionb"]! as! String
                    defaultQuestion.option3 = dict["optionc"]! as! String
                    defaultQuestion.option4 = dict["optiond"]! as! String
                    defaultQuestion.difficulty = 1
                    // Create an individual item
       
                return defaultQuestion
            }
        }
    }
    
    //function that poulates the next question on the screen.It sets all the fields and labels.
    
    func populateQuestion(Level:Int)
    {
        if fiftyFlag == false
        {
        fiftFityButton.hidden = false
        }
        
        if flipFlag == false
        {
            flipQuestionButton.hidden = false
        }
            nextButtion.hidden = true
        option1B.enabled = true
        option2B.enabled = true
        option3B.enabled = true
        option4B.enabled = true
        option1B.hidden = false
        option2B.hidden = false
        option3B.hidden = false
        option4B.hidden = false
        
         if(Level == 1)
         {
            let q = getQuestion(1)
            questionLabel.text = q?.question
            option1B.setTitle(q?.option1, forState: UIControlState.Normal)
            option2B.setTitle(q?.option2, forState: UIControlState.Normal)
            option3B.setTitle(q?.option3, forState: UIControlState.Normal)
            option4B.setTitle(q?.option4, forState: UIControlState.Normal)
            correctAnswer = q!.correctAnswer
            questionLevel = q!.difficulty
           
            count = count + 1
            levelCount = levelCount + 1
            pointsLabel.text = "Level : Easy"
            seconds = 30
        }
        else
        if Level == 2
        {
            let q = getQuestion(2)
            
            questionLabel.text = q?.question
            option1B.setTitle(q?.option1, forState: UIControlState.Normal)
            option2B.setTitle(q?.option2, forState: UIControlState.Normal)
            option3B.setTitle(q?.option3, forState: UIControlState.Normal)
            option4B.setTitle(q?.option4, forState: UIControlState.Normal)
            correctAnswer = q!.correctAnswer
            questionLevel = q!.difficulty
            count = count + 1
            levelCount = levelCount + 1
            pointsLabel.text = "Level : Medium"
            
            seconds = 25
        }
        else
        {
            let q = getQuestion(3)
            
            questionLabel.text = q?.question
            option1B.setTitle(q?.option1, forState: UIControlState.Normal)
            option2B.setTitle(q?.option2, forState: UIControlState.Normal)
            option3B.setTitle(q?.option3, forState: UIControlState.Normal)
            option4B.setTitle(q?.option4, forState: UIControlState.Normal)
            correctAnswer = q!.correctAnswer
            questionLevel = q!.difficulty
            count = count + 1
            levelCount = levelCount + 1
            pointsLabel.text = "Level : Hard"
            seconds = 20
        }
        
        
        timerLabel.textColor = UIColor.greenColor()
        
        timerLabel.text = "\(seconds)"
       
       
         timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: ("elapseTime"), userInfo: nil, repeats: true)
        
    }
    
    //method that is used to elapse time on the secods timer for the question.
    
    func elapseTime()
    {
    
     if seconds == 0
    {
        seconds = 0
        timerLabel.textColor = UIColor.redColor()
        
    }
    else
     {
        seconds = seconds - 1
        
    }
    timerLabel.text = "\(seconds)"
    }
    
    //function that passes control to the section selection screen.
    func differentSection()
    {
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("SectionScreen")
        self.showViewController(vc as! UIViewController, sender: vc)
    }
    //function that passes control to the main screen
    func goToMain()
    {
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("MainScreen")
        self.showViewController(vc as! UIViewController, sender: vc)
    }
    
    //function that returns the point based on time and level.
    func getPoint()->Int
    {
        if questionLevel == 1
        {
            return 5
        }
        else
            if questionLevel == 2
            {
                return 10
            }
            else
            {
                return 15
        }
        
    }
    
    //function that restarts a game
    func startOver ()
    {
       
        fiftFityButton.hidden = false
        flipQuestionButton.hidden = false
        qPopulate = QuizPopulate(section:quizSection,moc: self.managedObjectContext)

        quizQuestionList = QuizQuestions()
        quizQuestionList = qPopulate.returnQuestions()
        levelCount = 0
        questionLevel = 0
        count = 0
        score = 0
        populateQuestion(1)
       
    }
    //function to check if the current section of 5 question have been completed.
    //the user is presented with options like start over, different section,challenge friend,report score at the end of the quiz
    func gameOver()
    {
        nextButtion.hidden = false
        fiftFityButton.hidden = true
        flipQuestionButton.hidden = true
        
        if count == 5
        {
            timer.invalidate()
            let alertController = UIAlertController(title: "Quiz Completed", message: "You Scored: \(score)", preferredStyle: .Alert)
            
            // Create the actions
            let startAgain = UIAlertAction(title: "Start Over", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                self.startOver()
            }
            let diffSection = UIAlertAction(title: "Choose Different Section", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                self.differentSection()
            }
            let challangeFriend = UIAlertAction(title: "Challenge Friend", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                self.challengeFriend()
            }
            let reportScore = UIAlertAction(title: "Report Score", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                self.reportScore()
            }
            let addToAch = UIAlertAction(title: "Add to Achievement", style: UIAlertActionStyle.Default) {
                UIAlertAction in
                self.addToAchievements()
            }
            
            
            pointsLabel.text = ""
            // Add the actions
            alertController.addAction(startAgain)
            alertController.addAction(diffSection)
            alertController.addAction(challangeFriend)
            alertController.addAction(reportScore)
            alertController.addAction(addToAch)
          
            // Present the controller
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
 
    @IBAction func Option1Selected()
    {
        timer.invalidate()
        
        option1B.enabled = false
        option2B.enabled = false
        option3B.enabled = false
        option4B.enabled = false
        let answer = option1B.titleLabel!.text
        
        if answer == correctAnswer
        {
            let pointForQuestion = getPoint()
            let pointsEarned = (pointForQuestion * seconds )
            score = score + pointsEarned
            pointsLabel.text = "Points Earned : \(pointsEarned)"    
            if levelCount == 2
            {
                levelCount = 0
                questionLevel = questionLevel + 1
                
            }
         
        }
        else
        {
       
            pointsLabel.text = "Points Earned 0 "
            wrongCount = wrongCount + 1
            
            levelCount = levelCount - 1
        }
        gameOver()
    
    }
    @IBAction func Option2Selected()
    {
        timer.invalidate()
        option1B.enabled = false
        option2B.enabled = false
        option3B.enabled = false
        option4B.enabled = false
        let answer = option2B.titleLabel!.text
        
        if answer == correctAnswer
        {
            let pointForQuestion = getPoint()
            let pointsEarned = (pointForQuestion * seconds )
            score = score + pointsEarned
            pointsLabel.text = "Points Earned : \(pointsEarned)"
            if levelCount == 2
            {
                
                levelCount = 0
                questionLevel = questionLevel + 1
                
            }
            
        }
        else
        {
          
            pointsLabel.text = "Points Earned 0 "
            wrongCount = wrongCount + 1
            levelCount = levelCount - 1
           
            
        }
         gameOver()
    }
    

    
    @IBAction func Option3Selected()
    {
        timer.invalidate()
        option1B.enabled = false
        option2B.enabled = false
        option3B.enabled = false
        option4B.enabled = false
        let answer = option3B.titleLabel!.text
        
        if answer == correctAnswer
        {
            let pointForQuestion = getPoint()
            let pointsEarned = (pointForQuestion * seconds )
            score = score + pointsEarned
            pointsLabel.text = "Points Earned : \(pointsEarned)"
            if levelCount == 2
            {
                levelCount = 0
                questionLevel = questionLevel + 1
                
            }
            
        }
        else
        {
       
            pointsLabel.text = "Points Earned 0 "
            wrongCount = wrongCount + 1
            levelCount = levelCount - 1
           
        }
         gameOver()
    }
    @IBAction func Option4Selected()
    {
        timer.invalidate()
        option1B.enabled = false
        option2B.enabled = false
        option3B.enabled = false
        option4B.enabled = false
        let answer = option4B.titleLabel!.text
        
        if answer == correctAnswer
        {
            let pointForQuestion = getPoint()
            let pointsEarned = (pointForQuestion * seconds )
            score = score + pointsEarned
            pointsLabel.text = "Points Earned : \(pointsEarned)"
            if levelCount == 2
            {
                levelCount = 0
                questionLevel = questionLevel + 1
                
            }
            
        }
        else
        {
          
            pointsLabel.text = "Points Earned 0 "
            wrongCount = wrongCount + 1
            levelCount = levelCount - 1 
            
            
        }
        
        gameOver()
    }
    @IBAction func nextQuestion()
    {
      
        pointsLabel.text = ""
        populateQuestion(questionLevel)
        
    }
    @IBAction func fiftyFifty()
    {
        if correctAnswer != option1B.titleLabel!.text
        {
            option1B.hidden = true
        }
        if correctAnswer != option2B.titleLabel!.text
        {
            option2B.hidden = true
            
        }
        
        if option1B.hidden == false || option2B.hidden == false
        {
            option3B.hidden = true
        }
    
        fiftFityButton.hidden = true
        fiftyFlag = true
    }
    
    @IBAction func flipQuestion()
    {
    
            populateQuestion(questionLevel)
            levelCount = levelCount - 1
            count = count - 1 
            flipQuestionButton.hidden = true
            flipFlag = true
    
    }
    
    @IBAction func quit()
    {
    
    let alertController = UIAlertController(title: "Quit!", message: "What do you want to do?", preferredStyle: .Alert)
    
    // Create the actions
    let startAgain = UIAlertAction(title: "Start Over", style: UIAlertActionStyle.Default) {
    UIAlertAction in
    self.startOver()
    }
    let diffSection = UIAlertAction(title: "Choose Different Section", style: UIAlertActionStyle.Default) {
    UIAlertAction in
    self.differentSection()
    }
    let goToMain = UIAlertAction(title: "Go to Main menu", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            self.goToMain()
        }
  //  let cancel = UIAlertAction(title: "cancel", style: .Default, handler: nil)

    // Add the actions
    alertController.addAction(startAgain)
    alertController.addAction(diffSection)
    alertController.addAction(goToMain)
  //  alertController.addAction(cancel)
    
    // Present the controller
    self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        timerLabel.text = ""
        
  
        
        qPopulate = QuizPopulate(section:quizSection,moc: self.managedObjectContext)
        
        quizQuestionList = QuizQuestions()
        quizQuestionList = qPopulate.returnQuestions()
        populateQuestion(1)
    
        
        // Do any additional setup after loading the view.
    }
  
    
    //code to challenge friend. THis drafts an email so all the player needs to do is click send message.
    
    func challengeFriend()
    {
        var emailId  = ""
        let alert = UIAlertController(title: "Challenge Friend", message: "Enter friend's email id", preferredStyle: .Alert)
        
       
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            
        })
        
     
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let temp = alert.textFields![0] as UITextField
            emailId = temp.text!
            
            let mailComposeViewController = self.getEmail(emailId)
            if MFMailComposeViewController.canSendMail() {
                self.presentViewController(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
            self.differentSection()
            
        }))
        
       
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func getEmail(emailID :String ) -> MFMailComposeViewController {
        let mailer = MFMailComposeViewController()
        mailer.mailComposeDelegate = self
        
        mailer.setToRecipients([emailID])
        mailer.setSubject("Quiz Challenge for QuizAround ")
        mailer.setMessageBody("Hi! I would like to challenge you for a quiz on Quiz Around!. My high score was \(score) in the \(quizSection) section. ", isHTML: false)
        
        return mailer
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Error", message: "Could not challenge friend.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //function to report score to server.
    func reportScore()
    {
        
       // print("In report score")
        var name  = ""
        let alert = UIAlertController(title: "Report Score", message: "Enter your name.", preferredStyle: .Alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            
        })
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            let temp = alert.textFields![0] as UITextField
            name = temp.text!.stringByReplacingOccurrencesOfString(" ", withString: "")
            print(name)
            let userData = "\(self.quizSection),\(name),\(self.score)"
            var ip = ""
            if let path = NSBundle.mainBundle().pathForResource("Info", ofType: "plist") {
                let dict = NSDictionary(contentsOfFile: path)
                ip = (dict!.valueForKey("IP") as? String)!
                print(ip)
            }
            let session = NSURLSession.sharedSession()
            
            let urlString = "\(ip)/postScore?scoreData=\(userData)"
            let task = session.dataTaskWithURL(NSURL(string: urlString)!, completionHandler: {(data,response,error) in
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                

         
            })
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            task.resume()
           self.differentSection()
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    
    }
    
    //method to add score to achievements
    func addToAchievements()
    {
        
        let moc = self.managedObjectContext
        let date = "\(NSDate())"
        let x = date.componentsSeparatedByString(" ")
            Achievement.createInManagedObjectContext(moc,date: x[0], score: "\(self.score)", section:self.quizSection)
            do {
                try moc.save()                    //5
                
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
            self.goToMain()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
