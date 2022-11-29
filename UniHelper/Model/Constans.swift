//
//  Constans.swift
//  UniHelper
//
//  Created by Danila Belyi on 27.11.2022.
//

import Foundation

struct K {
    static let appName = "UniHelper"
    static let loginSegue = "LoginToUniversities"
    static let registerSegue = "RegisterToUniversities"
    static let universitiesSegue = "UniversitiesToDirections"
    static let universitiesCellIdentifier = "UniversitiesCell"
    static let directionCellIdentifier = "DirectionCell"
    static let cellNibName = "UniversityCell"
    
    struct VC {
        static let login = "Authorization"
        static let register = "Registration"
        static let universities = "Universities"
        static let directions = "Directions"
    }
    
    struct FStore {
        static let collectionName = "Universities"
        static let nameField = "name"
        static let directionField = "directionOfStudy"
        static let cityField = "city"
        static let typeOfEducationField = "typeEducation"
        static let passingScoreField = "passingScore"
        static let budgetAmountField = "budgetAmount"
        static let costEducationField = "costEducation"
        static let informationHostelsField = "informationHostels"
        static let formOfEducationField = "formOfEducation"
    }
}
