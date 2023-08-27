//
//  SeeAllLossesViewModel.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import Foundation

protocol SeeAllLossesViewModelProtocol {
    func numberOfRows() -> Int
    func getModel() -> ResponseInfoType
    func didSelectRow(at row: Int) -> ResponseInfoType?
}

final class SeeAllLossesViewModel: SeeAllLossesViewModelProtocol {
    private let responseInfoType: ResponseInfoType
    
    init(_ model: ResponseInfoType) {
        responseInfoType = model
    }

    func numberOfRows() -> Int {
        switch responseInfoType {
        case .equipmentCorrectionModel(let model):
            return model.count
        case .equipmentOryxModel(let model):
            return model.count
        case .equipmentModel(let model):
            return model.count
        case .personnelModel(let model):
            return model.count
        }
    }
    
    func getModel() -> ResponseInfoType {
        return responseInfoType
    }
    
    func didSelectRow(at row: Int) -> ResponseInfoType? {
        var resultModel: ResponseInfoType?
        switch responseInfoType {
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
