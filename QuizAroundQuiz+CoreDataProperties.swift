//
//  QuizAroundQuiz+CoreDataProperties.swift
//  QuizAround
//
//  Created by Student on 4/30/16.
//  Copyright © 2016 Student. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension QuizAroundQuiz {

    @NSManaged var answer: String?
    @NSManaged var difficulty: String?
    @NSManaged var optiona: String?
    @NSManaged var optionb: String?
    @NSManaged var optionc: String?
    @NSManaged var optiond: String?
    @NSManaged var question: String?
    @NSManaged var section: String?

}
