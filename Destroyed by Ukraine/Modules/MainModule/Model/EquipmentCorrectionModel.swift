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
    
    func forEachProperty(_ action: (String, String) -> Void) {
        action(Helper.TranslationKeys.date.localized, self.date)
        action(Helper.TranslationKeys.day.localized, "\(self.day)")
        action(Helper.TranslationKeys.aircraft.localized, "\(self.aircraft)")
        action(Helper.TranslationKeys.helicopter.localized, "\(self.helicopter)")
        action(Helper.TranslationKeys.tank.localized, "\(self.tank)")
        action(Helper.TranslationKeys.apc.localized, "\(self.apc)")
        action(Helper.TranslationKeys.fieldArtillery.localized, "\(self.fieldArtillery)")
        action(Helper.TranslationKeys.mrl.localized, "\(self.mrl)")
        action(Helper.TranslationKeys.drone.localized, "\(self.drone)")
        action(Helper.TranslationKeys.navalShip.localized, "\(self.navalShip)")
        action(Helper.TranslationKeys.antiAircraftWarfare.localized, "\(self.antiAircraftWarfare)")
        action(Helper.TranslationKeys.specialEquipment.localized, "\(self.specialEquipment)")
        action(Helper.TranslationKeys.vehiclesAndFuelTanks.localized, "\(self.vehiclesAndFuelTanks)")
        action(Helper.TranslationKeys.cruiseMissiles.localized, "\(self.cruiseMissiles)")
    }
    
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
