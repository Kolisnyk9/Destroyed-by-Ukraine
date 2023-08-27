//
//  MainViewModel.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 24/08/2023.
//

import Foundation

protocol MainViewModelProtocol {
    func numberOfSection() -> Int
    func getPersonnelModel(with row: Int) -> PersonnelModel
    func getEquipmentCorrectionModel(with row: Int) -> EquipmentCorrectionModel
    func getEquipmentOryxModel(with row: Int) -> EquipmentOryxModel
    func getEquipmentModel(with row: Int) -> EquipmentModel
    func getResponseInfoType(_ row: Int) -> ResponseInfoType
}

final class MainViewModel: MainViewModelProtocol {
    private var personnelModel: [PersonnelModel] = []
    private var equipmentCorrectionModel: [EquipmentCorrectionModel] = []
    private var equipmentOryxModel: [EquipmentOryxModel] = []
    private var equipmentModel: [EquipmentModel] = []

    var responseInfo: [ResponseInfoType] = []
    
    init() {
        loadPersonnelDataFromJSONFile()
    }
    
    private func loadPersonnelDataFromJSONFile(){
        
        if let path = Bundle.main.path(forResource: "russia_losses_personnel", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let personnelData = try JSONDecoder().decode([PersonnelModel].self, from: data)
                personnelModel = personnelData
                if !personnelModel.isEmpty {
                    responseInfo.append(.personnelModel(model: personnelData))
                }
            } catch {
                print("Error: \(error)")
                personnelModel = []
            }
        }
        
        if let path = Bundle.main.path(forResource: "russia_losses_equipment", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let equipmentData = try JSONDecoder().decode([EquipmentModel].self, from: data)
                equipmentModel = equipmentData
                if !equipmentModel.isEmpty {
                    responseInfo.append(.equipmentModel(model: equipmentModel))
                }
            } catch {
                print("Error: \(error)")
                equipmentModel = []
            }
        }
        if let path = Bundle.main.path(forResource: "russia_losses_equipment_oryx", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let personnelData = try JSONDecoder().decode([EquipmentOryxModel].self, from: data)
                equipmentOryxModel = personnelData
                if !equipmentOryxModel.isEmpty {
                    responseInfo.append(.equipmentOryxModel(model: equipmentOryxModel))
                }
            } catch {
                print("Error: \(error)")
                equipmentOryxModel = []
            }
        }
        
        if let path = Bundle.main.path(forResource: "russia_losses_equipment_correction", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let personnelData = try JSONDecoder().decode([EquipmentCorrectionModel].self, from: data)
                equipmentCorrectionModel = personnelData
                if !equipmentCorrectionModel.isEmpty {
                    responseInfo.append(.equipmentCorrectionModel(model: equipmentCorrectionModel))
                }
            } catch {
                print("Error: \(error)")
                equipmentCorrectionModel = []
            }
        }
    }
    
    func numberOfSection() -> Int {
        return responseInfo.count
    }
    

    
    func getPersonnelModel(with row: Int) -> PersonnelModel {
        return personnelModel[row]
    }
    
    func getEquipmentCorrectionModel(with row: Int) -> EquipmentCorrectionModel {
        return equipmentCorrectionModel[row]
    }
    
    func getEquipmentOryxModel(with row: Int) -> EquipmentOryxModel {
        return equipmentOryxModel[row]
    }
    
    func getEquipmentModel(with row: Int) -> EquipmentModel {
        return equipmentModel[row]
    }
    
    func getResponseInfoType(_ row: Int) -> ResponseInfoType {
        return responseInfo[row]
    }
}
