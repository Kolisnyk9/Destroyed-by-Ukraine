//
//  SeeAllLossesViewController.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import UIKit

class SeeAllLossesViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var viewModel: SeeAllLossesViewModel?
    weak var delegate: CategoryInfoDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    func transferData(_ model: ResponseInfoType) {
        viewModel = SeeAllLossesViewModel(model)
    }
    private func configureTableView() {
        tableView.register(UINib(nibName: SeeAllLossesTableViewCell.reusedIdentifier, bundle: nil), forCellReuseIdentifier: SeeAllLossesTableViewCell.reusedIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
}

extension SeeAllLossesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel, let cell = tableView.dequeueReusableCell(withIdentifier: SeeAllLossesTableViewCell.reusedIdentifier, for: indexPath) as? SeeAllLossesTableViewCell else { return UITableViewCell() }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel?.getModel()
        delegate?.didSelect(with: model)
    }
}
