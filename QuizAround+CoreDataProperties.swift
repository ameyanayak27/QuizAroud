//
//  QuizAround+CoreDataProperties.swift
//  QuizAround
//
//  Created by Ameya and Salil

import Foundation
import CoreData

extension QuizAround {

    @NSManaged var answer: String?
    @NSManaged var difficulty: String?
    @NSManaged var optiona: String?
    @NSManaged var optionb: String?
    @NSManaged var optionc: String?
    @NSManaged var optiond: String?
    @NSManaged var question: String?
    @NSManaged var section: String?

}
