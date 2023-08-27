//
//  DetailViewModel.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import UIKit

final class DetailViewModel {
    private let responseInfoType: ResponseInfoType?
    
    init(_ model: ResponseInfoType) {
        responseInfoType = model
    }
    
    func getDetailInfo(completion: (String, String) -> Void) {
        guard let responseInfoType else { return }
        switch responseInfoType {
        case .equipmentCorrectionModel(let model):
            model.first?.forEachProperty(completion)
        case .equipmentOryxModel(let model):
            model.first?.forEachProperty(completion)
        case .equipmentModel(let model):
            model.first?.forEachProperty(completion)
        case .personnelModel(let model):
            model.first?.forEachProperty(completion)
        }
    }
    
    func getImage() -> UIImage? {
        guard let responseInfoType else { return nil }
        switch responseInfoType {
        case .equipmentCorrectionModel(_):
            return .russianWarship
        case .equipmentOryxModel(let model):
            return model.first?.equipmentUa.image
        case .equipmentModel(_):
            return .russianWarship
        case .personnelModel(_):
            return .russianWarship
        }
    }
}
