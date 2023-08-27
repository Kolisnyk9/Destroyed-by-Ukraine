//
//  PersonnelModel.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 24/08/2023.
//

import Foundation

struct PersonnelModel: Codable {
    let date: String?
    let day, personnel: Int?
    let welcomePersonnel: String?
    let pow: Int?

    func forEachProperty(_ action: (String, String) -> Void) {
        if let date {
            action(Helper.TranslationKeys.date.localized, date)
        }
        if let day {
            action(Helper.TranslationKeys.day.localized, "\(day)")
        }
        if let personnel {
            action(Helper.TranslationKeys.personnel.localized, "\(personnel)")
        }
        if let welcomePersonnel {
            action(Helper.TranslationKeys.welcomePersonnel.localized, welcomePersonnel)
        }
        if let pow {
            action(Helper.TranslationKeys.pow.localized, "\(pow)")
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case welcomePersonnel = "personnel*"
        case pow = "POW"
    }
}
