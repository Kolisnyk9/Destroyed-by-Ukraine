//
//  PersonnelCollectionViewCell.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 23/08/2023.
//

import UIKit

class PersonnelCollectionViewCell: UICollectionViewCell {
    static let reusedIdentifier = "PersonnelCollectionViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var counterCapsuleView: UIView!
    @IBOutlet private weak var personalLabel: UILabel!
    @IBOutlet private weak var containerStackView: UIStackView!
    
    private var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func getCellWidth() -> CGFloat {
        return containerStackView.frame.width
    }
    
    private func setupUI() {
        makeCapsuleView()
        titleLabel.textColor = .white
        counterLabel.textColor = .white
        personalLabel.textColor = .white
        containerStackView.layer.masksToBounds = true
        containerStackView.layer.cornerRadius = 10
        containerStackView.backgroundColor = .blueColor?.withAlphaComponent(0.7)
    }
    
    private func makeCapsuleView() {
        counterCapsuleView.backgroundColor = .yellowColor?.withAlphaComponent(0.8)
        counterCapsuleView.layer.masksToBounds = true
        counterCapsuleView.layer.cornerRadius = 20
    }
    
    func configurePersonnelCell(with model: PersonnelModel) {
        titleLabel.text = "Destroyed: \(model.personnel ?? 0)"
        guard let currentDate = dateFormatter.date(from: model.date ?? "") else { return }
        counterLabel.text = "\(currentDate.daysBetween(dateFormatter))th day"
        personalLabel.text = "POW - \(model.pow ?? 0)"
        setupUI()
    }
    
    func configureEquipmentCorrectionModelCell(with model: EquipmentCorrectionModel) {
        titleLabel.text = model.date
        guard let currentDate = dateFormatter.date(from: model.date) else { return }
        counterLabel.text = "\(currentDate.daysBetween(dateFormatter))th day"
        personalLabel.text = "Destroyed: \n \(model.totalDestroyed)"

        setupUI()
    }
    
    func configureEquipmentModelCell(with model: EquipmentModel) {
        titleLabel.text = model.date
        guard let currentDate = dateFormatter.date(from: model.date) else { return }
        counterLabel.text = "\(currentDate.daysBetween(dateFormatter))th day"
        personalLabel.text = "Equipment: \n \(model.destroyedEquipment)"
        personalLabel.textAlignment = .center
        setupUI()
    }
    
    func configureEquipmentOryxModelCell(with model: EquipmentOryxModel) {
        titleLabel.text = model.model
        let conditionalStatement = model.lossesTotal == 1 ? "pc" : "pcs"
        counterLabel.text = "\(model.lossesTotal)" + " " + conditionalStatement
        personalLabel.text = model.equipmentUa.rawValue
        setupUI()
    }

}
