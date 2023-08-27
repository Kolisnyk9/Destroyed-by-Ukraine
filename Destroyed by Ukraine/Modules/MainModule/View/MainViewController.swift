//
//  ViewController.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 23/08/2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    lazy var viewModel: MainViewModel = {
        return MainViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.register(MainTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: MainTableViewHeaderView.reusedIdentifier)
        tableView.register(UINib(nibName: CategoryTableViewCell.reusedIdentifier, bundle: nibBundle), forCellReuseIdentifier: CategoryTableViewCell.reusedIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.reusedIdentifier, for: indexPath) as! CategoryTableViewCell
        let model = viewModel.getResponseInfoType(indexPath.section)
        cell.configureCell(with: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: MainTableViewHeaderView.reusedIdentifier) as! MainTableViewHeaderView
        headerView.configure(withTitle: viewModel.getResponseInfoType(section).title)
        return headerView

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}


extension MainViewController: CategoryTableViewCellDelegate {
    func didSelect(with model: ResponseInfoType?) {
        guard let model else { return }
        let vc = DetailViewController.instantiate()
        vc.transferData(model)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
