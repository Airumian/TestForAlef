//
//  AddChildButtonView
//  TestForAlef
//
//  Created by Alexander Airumyan on 30.07.2021.
//

import UIKit

class AddClildButtonView: UIView {
	
	// MARK: - Callbacks
	
	var onButtonTouched: (() -> Void)?
	
	// MARK: - Private Properties
	
	private let mainButton = UIButton()
	
	// MARK: - Initialization
	
	init() {
		super.init(frame: .zero)
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
private extension AddClildButtonView {
	func setupConstraints() {
		addSubview(mainButton)
		mainButton.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			mainButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			mainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
			mainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
			mainButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
			mainButton.heightAnchor.constraint(equalToConstant: 60)
		])
	}
	
	func setupMainButton() {
		mainButton.setImage(UIImage(systemName: "plus"), for: .normal)
		mainButton.layer.cornerRadius = 16
		mainButton.backgroundColor = .blue
		mainButton.imageView?.tintColor = .white
		
		mainButton.addTarget(self,
							 action: #selector(mainButtonTouched),
							 for: .touchUpInside)
	}
	
	@objc func mainButtonTouched (_ sender: UIButton){
		onButtonTouched?()
	}
}
