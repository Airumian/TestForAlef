//
//  RemoveChildTableViewCell.swift
//  TestForAlef
//
//  Created by Alexander Airumyan on 30.07.2021.
//

import UIKit

class RemoveChildTableViewCell: UITableViewCell {
	
	// MARK: - Callbacks
	
	var onButtonTouched: (() -> Void)?
	
	// MARK: - Private Properties
	
	private let mainButton = UIButton()
	
	// MARK: - Initialization
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		setupConstraints()
		setupMainButton()
		
		backgroundColor = .clear
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Private Methods
private extension RemoveChildTableViewCell {
	func setupConstraints() {
		contentView.addSubview(mainButton)
		mainButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			mainButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			mainButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
			mainButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
			mainButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
			mainButton.heightAnchor.constraint(equalToConstant: 60)
		])
	}
	
	func setupMainButton() {
		mainButton.setTitle("Удалить ребенка", for: .normal)
		mainButton.layer.cornerRadius = 16
		mainButton.backgroundColor = .red
		mainButton.imageView?.tintColor = .white
		
		mainButton.addTarget(self,
							 action: #selector(mainButtonTouched),
							 for: .touchUpInside)
	}
	
	@objc func mainButtonTouched (_ sender: UIButton){
		onButtonTouched?()
	}
}
