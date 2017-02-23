//
//  QuizAround.swift
//  QuizAround
//
//  Created by Ameya and Salil 
//

import Foundation
import CoreData

@objc(QuizAround)
public class QuizAround: NSManagedObject {
    //Initialize members of Quiz
    class func createInManagedObjectContext(moc: NSManagedObjectContext, question: String, difficulty: String, section: String, optiona: String, optionb: String, optionc: String, optiond: String, answer: String) -> QuizAround {
        let quiz = NSEntityDescription.insertNewObjectForEntityForName("Quiz", inManagedObjectContext: moc) as! QuizAround
        quiz.question = question
        quiz.answer = answer
        quiz.section = section
        quiz.difficulty = difficulty
        quiz.optiona = optiona
        quiz.optionb = optionb
        quiz.optionc = optionc
        quiz.optiond = optiond
        return quiz
}
}
