//
//  DetailViewController.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet private weak var containerStackView: UIStackView!
    @IBOutlet private weak var infoStackView: UIStackView!
    @IBOutlet private weak var topImageView: UIImageView!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
        viewModel?.getDetailInfo(completion: { key, value in
            let label = UILabel()
            label.text = key + " - " + value
            infoStackView.addArrangedSubview(label)
        })
        topImageView.image = viewModel?.getImage() ?? .russianWarship
    }
    
    func transferData(_ model: ResponseInfoType) {
        viewModel = DetailViewModel(model)
    }

}
