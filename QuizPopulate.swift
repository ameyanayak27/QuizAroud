//
//  QuizPopulate.swift
//  QuizAround
//
//  Created by Ameya and Salil
//

import Foundation
import CoreData

//populate the questions for quiz based on user's selection of section
class QuizPopulate
{

    var q:QuizQuestions
    

    init(section: String,moc: NSManagedObjectContext)
    {
        
        let request = NSFetchRequest(entityName: "Quiz")
        let filter = NSPredicate(format: "section == %@", section)
       // print(section)
        
        // Set the predicate on the fetch request
        request.predicate = filter
        q = QuizQuestions()

        do{
            //fetch from core data
            if let results = try moc.executeFetchRequest(request) as? [QuizAround] {
                
                // Create an Alert, and set it's message to whatever the itemText is
                for (result) in results{
                    let q1 = Question()
                    q1.question = result.question!
                    q1.option1 = result.optiona!
                    q1.option2 = result.optionb!
                    q1.option3 = result.optionc!
                    q1.option4 = result.optiond!
                    q1.correctAnswer = result.answer!
                    
                    //append the question to the set of appropriate difficulty level
                    switch result.difficulty
                    {
                        case "easy"?:
                            q1.difficulty = 1
                            q.easyQ.append(q1)
                        
                        case "medium"?:
                            q1.difficulty = 2
                            q.medQ.append(q1)
                        case "hard"?:
                            q1.difficulty = 3
                            q.hardQ.append(q1)
                        default:
                            print("Nothing")

                    }
                   // print(result.question)
                }
            }
        }
        catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
  
        
        
    
    }
    
    func returnQuestions()->QuizQuestions
    {
        return q
    }

}