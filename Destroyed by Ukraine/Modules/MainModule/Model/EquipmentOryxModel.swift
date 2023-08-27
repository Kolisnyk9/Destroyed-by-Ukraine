//
//  EquipmentOryxModel.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 24/08/2023.
//

import UIKit

struct EquipmentOryxModel: Codable {
    let equipmentOryx, model: String
    let manufacturer: Manufacturer
    let lossesTotal: Int
    let equipmentUa: EquipmentUa
    
    func forEachProperty(_ action: (String, String) -> Void) {
        action(Helper.TranslationKeys.equipmentOryx.localized, self.equipmentOryx)
        action(Helper.TranslationKeys.model.localized, self.model)
        action(Helper.TranslationKeys.lossesTotal.localized, "\(self.lossesTotal)")
        action(Helper.TranslationKeys.manufacturer.localized, self.manufacturer.rawValue)
        action(Helper.TranslationKeys.equipmentUa.localized, self.equipmentUa.rawValue)
    }
    
    enum CodingKeys: String, CodingKey {
        case equipmentOryx = "equipment_oryx"
        case model, manufacturer
        case lossesTotal = "losses_total"
        case equipmentUa = "equipment_ua"
    }
}

enum EquipmentUa: String, Codable {
    case aircrafts = "Aircrafts"
    case antiAircraftWarfareSystems = "Anti-aircraft Warfare Systems"
    case armouredPersonnelCarriers = "Armoured Personnel Carriers"
    case artillerySystems = "Artillery Systems"
    case helicopters = "Helicopters"
    case multipleRocketLaunchers = "Multiple Rocket Launchers"
    case specialEquipment = "Special Equipment"
    case tanks = "Tanks"
    case unmannedAerialVehicles = "Unmanned Aerial Vehicles"
    case vehicleAndFuelTank = "Vehicle and Fuel Tank"
    case warshipsBoats = "Warships, Boats"
    
    var image: UIImage? {
        switch self {
        case .aircrafts:
            return .aircrafts
        case .armouredPersonnelCarriers, .vehicleAndFuelTank, .specialEquipment:
            return .armouredPersonnelCarriers
        case .artillerySystems, .multipleRocketLaunchers, .antiAircraftWarfareSystems:
            return .artillerySystems
        case .helicopters:
            return .helicopter
        case .tanks:
            return .tank
        case .unmannedAerialVehicles:
            return .unmannedAerialVehicles
        case .warshipsBoats:
            return .warship
        }
    }
}

enum Manufacturer: String, Codable {
    case iran = "Iran"
    case israel = "Israel"
    case italy = "Italy"
    case poland = "Poland"
    case russia = "Russia"
    case theCzechRepublic = "the Czech Republic"
    case theSovietUnion = "the Soviet Union"
}
