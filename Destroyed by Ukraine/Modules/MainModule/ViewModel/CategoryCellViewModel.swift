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
    
    func didSelectRow(at row: Int) -> ResponseInfoType? {
        var resultModel: ResponseInfoType?
        switch model {
        case .equipmentCorrectionModel(let model):
            resultModel = ResponseInfoType.equipmentCorrectionModel(model: [model[row]])
        case .equipmentOryxModel(let model):
            resultModel = ResponseInfoType.equipmentOryxModel(model: [model[row]])
        case .equipmentModel(let model):
            resultModel = ResponseInfoType.equipmentModel(model: [model[row]])
        case .personnelModel(let model):
            resultModel = ResponseInfoType.personnelModel(model: [model[row]])
        }
        return resultModel
    }
    
}
