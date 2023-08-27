//
//  ResponseInfoType.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import Foundation

enum ResponseInfoType {
    case equipmentCorrectionModel(model: [EquipmentCorrectionModel])
    case equipmentOryxModel(model: [EquipmentOryxModel])
    case equipmentModel(model: [EquipmentModel])
    case personnelModel(model: [PersonnelModel])
    
    var title: String {
        switch self {
        case .equipmentCorrectionModel(_):
            return Helper.TranslationKeys.equipmentCorrectionLosses.localized
        case .equipmentOryxModel(_):
            return Helper.TranslationKeys.equipmentOryxLosses.localized
        case .equipmentModel(_):
            return Helper.TranslationKeys.equipmentLosses.localized
        case .personnelModel(_):
            return Helper.TranslationKeys.personnelLosses.localized
        }
    }
}
