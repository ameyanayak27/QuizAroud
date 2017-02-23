//
//  Achievement.swift
//  QuizAround
//
//  Created by Ameya and Salil
//

import Foundation
import CoreData


class Achievement: NSManagedObject {

// Initialize members of Achievements
    class func createInManagedObjectContext(moc: NSManagedObjectContext, date: String, score: String, section: String) -> Achievement {
        let achievement = NSEntityDescription.insertNewObjectForEntityForName("Achievement", inManagedObjectContext: moc) as! Achievement
        achievement.date = date
        achievement.score = score
        achievement.section = section
        return achievement
    }

}
