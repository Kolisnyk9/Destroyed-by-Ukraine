//
//  EquipmentCorrectionModel.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 24/08/2023.
//

import Foundation

struct EquipmentCorrectionModel: Codable {
    let date: String
    let day, aircraft, helicopter, tank: Int
    let apc, fieldArtillery, mrl, drone: Int
    let navalShip, antiAircraftWarfare, specialEquipment, vehiclesAndFuelTanks: Int
    let cruiseMissiles: Int
    
    var totalDestroyed: Int {
        let integerProperties: [Int] = [ aircraft, helicopter, tank, apc, fieldArtillery, mrl, drone, navalShip, antiAircraftWarfare, specialEquipment, vehiclesAndFuelTanks, cruiseMissiles]
        
        return integerProperties.reduce(0, +)
    }
    


    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
}
