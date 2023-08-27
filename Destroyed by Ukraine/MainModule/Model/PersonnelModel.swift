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

    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case welcomePersonnel = "personnel*"
        case pow = "POW"
    }
}
