//
//  SeeAllLossesTableViewCell.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import UIKit

class SeeAllLossesTableViewCell: UITableViewCell {
    static let reusedIdentifier = "SeeAllLossesTableViewCell"
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configurePersonnelCell(with model: PersonnelModel) {
        coverImageView.image = .russianWarship
        titleLabel.text = model.date
        descriptionLabel.text = "Destroyed: \(model.personnel ?? 0)"
    }
    
    func configureEquipmentCorrectionModelCell(with model: EquipmentCorrectionModel) {
        coverImageView.image = .russianWarship
        titleLabel.text = model.date
        descriptionLabel.text = "Destroyed: \n \(model.totalDestroyed)"
    }
    
    func configureEquipmentModelCell(with model: EquipmentModel) {
        coverImageView.image = .russianWarship
        titleLabel.text = model.date
        descriptionLabel.text = "Equipment: \n \(model.destroyedEquipment)"
    }
    
    func configureEquipmentOryxModelCell(with model: EquipmentOryxModel) {
        coverImageView.image = model.equipmentUa.image
        titleLabel.text = model.equipmentUa.rawValue
        let conditionalStatement = model.lossesTotal == 1 ? "pc" : "pcs"
        descriptionLabel.text = "\(model.lossesTotal)" + " " + conditionalStatement

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
