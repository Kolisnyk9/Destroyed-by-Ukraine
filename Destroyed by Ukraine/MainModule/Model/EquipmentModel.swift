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
