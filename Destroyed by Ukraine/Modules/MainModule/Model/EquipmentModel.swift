//
//  EquipmentModel.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 24/08/2023.
//

import Foundation

struct EquipmentModel: Codable {
    let date: String
    let day, aircraft, helicopter, tank: Int
    let apc, fieldArtillery, mrl: Int
    let militaryAuto, fuelTank: Int?
    let drone, navalShip, antiAircraftWarfare: Int
    let specialEquipment, mobileSRBMSystem: Int?
    let greatestLossesDirection: String?
    let vehiclesAndFuelTanks, cruiseMissiles: Int?

    func forEachProperty(_ action: (String, String) -> Void) {
        action(Helper.TranslationKeys.date.localized, self.date)
        action(Helper.TranslationKeys.day.localized, "\(self.day)")
        action(Helper.TranslationKeys.aircraft.localized, "\(self.aircraft)")
        action(Helper.TranslationKeys.helicopter.localized, "\(self.helicopter)")
        action(Helper.TranslationKeys.tank.localized, "\(self.tank)")
        action(Helper.TranslationKeys.apc.localized, "\(self.apc)")
        action(Helper.TranslationKeys.fieldArtillery.localized, "\(self.fieldArtillery)")
        action(Helper.TranslationKeys.mrl.localized, "\(self.mrl)")
        if let militaryAuto {
            action(Helper.TranslationKeys.militaryAuto.localized, "\(militaryAuto)")
        }
        if let fuelTank {
            action(Helper.TranslationKeys.fuelTank.localized, "\(fuelTank)")
        }
        action(Helper.TranslationKeys.drone.localized, "\(self.drone)")
        action(Helper.TranslationKeys.navalShip.localized, "\(self.navalShip)")
        action(Helper.TranslationKeys.antiAircraftWarfare.localized, "\(self.antiAircraftWarfare)")
        if let specialEquipment {
            action(Helper.TranslationKeys.specialEquipment.localized, "\(specialEquipment)")
        }
        if let mobileSRBMSystem {
            action(Helper.TranslationKeys.mobileSRBMSystem.localized, "\(mobileSRBMSystem)")
        }
        if let greatestLossesDirection {
            action(Helper.TranslationKeys.greatestLossesDirection.localized, greatestLossesDirection)
        }
        if let vehiclesAndFuelTanks {
            action(Helper.TranslationKeys.vehiclesAndFuelTanks.localized, "\(vehiclesAndFuelTanks)")
        }
        if let cruiseMissiles {
            action(Helper.TranslationKeys.cruiseMissiles.localized, "\(cruiseMissiles)")
        }
        if let cruiseMissiles {
            action(Helper.TranslationKeys.cruiseMissiles.localized, "\(cruiseMissiles)")
        }
    }
    
    var destroyedEquipment: Int {
        var total = 0
        
        total += self.day
        total += self.aircraft
        total += self.helicopter
        total += self.tank
        total += self.apc
        total += self.fieldArtillery
        total += self.mrl
        
        if let militaryAuto = self.militaryAuto {
            total += militaryAuto
        }
        if let fuelTank = self.fuelTank {
            total += fuelTank
        }
        
        total += self.drone
        total += self.navalShip
        total += self.antiAircraftWarfare
        
        if let specialEquipment = self.specialEquipment {
            total += specialEquipment
        }
        if let mobileSRBMSystem = self.mobileSRBMSystem {
            total += mobileSRBMSystem
        }
        
        if let vehiclesAndFuelTanks = self.vehiclesAndFuelTanks {
            total += vehiclesAndFuelTanks
        }
        if let cruiseMissiles = self.cruiseMissiles {
            total += cruiseMissiles
        }
        
        return total
    }
    
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case drone
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        case greatestLossesDirection = "greatest losses direction"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
}
