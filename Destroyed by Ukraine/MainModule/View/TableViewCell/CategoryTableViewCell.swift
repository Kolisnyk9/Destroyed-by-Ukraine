//
//  CategoryTableViewCell.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    static let reusedIdentifier = "CategoryTableViewCell"
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var viewModel: CategoryCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    
    func configureCell(with modelType: ResponseInfoType) {
        self.viewModel = CategoryCellViewModel(model: modelType)
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: PersonnelCollectionViewCell.reusedIdentifier, bundle: nil), forCellWithReuseIdentifier: PersonnelCollectionViewCell.reusedIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel,
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonnelCollectionViewCell.reusedIdentifier, for: indexPath) as? PersonnelCollectionViewCell
        else { return UICollectionViewCell() }
        
        switch viewModel.getModel() {
        case .equipmentCorrectionModel(let model):
            cell.configureEquipmentCorrectionModelCell(with: model[indexPath.row])
        case .equipmentOryxModel(let model):
            cell.configureEquipmentOryxModelCell(with: model[indexPath.row])
        case .equipmentModel(let model):
            cell.configureEquipmentModelCell(with: model[indexPath.row])
        case .personnelModel(let model):
            cell.configurePersonnelCell(with: model[indexPath.row])
        }
        return cell
    }
}
