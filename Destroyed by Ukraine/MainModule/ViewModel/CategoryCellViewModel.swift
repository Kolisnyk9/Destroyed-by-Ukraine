//
//  CategoryCellViewModel.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import Foundation

class CategoryCellViewModel {
    private let model: ResponseInfoType
    
    init(model: ResponseInfoType) {
        self.model = model
    }
    
    var numberOfItems: Int {
        switch model {
        case .equipmentCorrectionModel(let equipmentCorrectionModel):
            return equipmentCorrectionModel.count
        case .equipmentOryxModel(let equipmentOryxModel):
            return equipmentOryxModel.count
        case .equipmentModel(let equipmentModel):
            return equipmentModel.count
        case .personnelModel(let personnelModel):
            return personnelModel.count
        }
    }
    
    func getModel() -> ResponseInfoType {
        return model
    }
    
}
