//
//  MainTableViewHeaderView.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import UIKit

protocol MainTableViewHeaderDelegate: AnyObject {
    func didPressSeeAll(with model: ResponseInfoType)
}

class MainTableViewHeaderView: UITableViewHeaderFooterView {
    static let reusedIdentifier = "MainTableViewHeaderView"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .navyColor
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Helper.TranslationKeys.seeAll.localized, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .yellowColor
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var model: ResponseInfoType?
    
    weak var delegate: MainTableViewHeaderDelegate?
    
    @objc private func seeAllButtonTapped() {
        guard let model else { return }
        delegate?.didPressSeeAll(with: model)
    }
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(seeAllButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            seeAllButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: seeAllButton.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: seeAllButton.leadingAnchor, multiplier: 8),
            seeAllButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // You can also create functions to configure the header view with data
    func configure(withTitle model: ResponseInfoType) {
        self.model = model
        titleLabel.text = model.title
    }
}
