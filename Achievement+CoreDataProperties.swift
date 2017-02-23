//
//  Achievement+CoreDataProperties.swift
//  QuizAround
//
//  Created by Ameya and Salil
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Achievement {

    @NSManaged var section: String?
    @NSManaged var date: String?
    @NSManaged var score: String?

}
