//
//  MainViewController.swift
//  TestForAlef
//
//  Created by Alexander Airumian on 28.07.2021.
//

import UIKit

enum TextFieldType {
	/// Фамилия
	case firstName
	/// Имя
	case lastName
	/// Отчество
	case middleName
	/// Возраст
	case age
}

class MainViewController: UIViewController {
	
	// MARK: - Private Properties
	
	private let tableView = UITableView(frame: .zero, style: .insetGrouped)
	
	private var mainParent = Parent()
	private var kids: [Kid] = []
	
	// MARK: - Life Cycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupConstraints()
		setupTableView()
		hideKeyboardWhenTappedAround()
		
		
		title = "Родитель и дети"
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupKeyboardNotifications()
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}

// MARK: - Private Methods
private extension MainViewController {
	func setupConstraints() {
		[tableView].forEach { customView in
			view.addSubview(customView)
			customView.translatesAutoresizingMaskIntoConstraints = false
		}
		
		NSLayoutConstraint.activate([
			
			tableView.topAnchor.constraint(equalTo: view.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	func setupTableView() {
		tableView.dataSource = self
		tableView.tableFooterView = getTableFooterView()
		registerCells()
	}
	
	func registerCells() {
		tableView.register(TextFieldTableViewCell.self,
						   forCellReuseIdentifier: "TextFieldTableViewCell")
		tableView.register(RemoveChildTableViewCell.self,
						   forCellReuseIdentifier: "RemoveChildTableViewCell")
	}
	
	func getTextFieldCell(placeholder: String,
						  text: String?,
						  type: TextFieldType,
						  indexPath: IndexPath) -> TextFieldTableViewCell {
		guard let cell = tableView.dequeueReusableCell(
				withIdentifier: "TextFieldTableViewCell",
				for: indexPath) as? TextFieldTableViewCell
		else { return TextFieldTableViewCell() }
		
		let keyboardType: UIKeyboardType = type == .age ? .numberPad : .default
		
		cell.configure(placeholder: placeholder,
					   text: text,
					   keyboardType: keyboardType)
		cell.onTextEnter = { text in
			switch type {
			case .firstName:
				self.mainParent.firstName = text
			case .lastName:
				self.mainParent.lastName = text
			case .middleName:
				self.mainParent.middleName = text
			case .age:
				self.mainParent.age = text
			}
		}
		
		return cell
	}
	
	func getRemoveKidCell(indexPath: IndexPath) -> RemoveChildTableViewCell {
		guard let cell = tableView.dequeueReusableCell(
				withIdentifier: "RemoveChildTableViewCell",
				for: indexPath) as? RemoveChildTableViewCell
		else { return RemoveChildTableViewCell() }
		
		cell.onButtonTouched = {
			let kidIndex = indexPath.section - 1
			self.kids.remove(at: kidIndex)
			self.tableView.tableFooterView = self.getTableFooterView()
			self.tableView.reloadData()
		}
		
		return cell
	}
	
	func getTableFooterView() -> AddClildButtonView {
		let view = AddClildButtonView()
		
		view.frame.size.height = 76
		
		view.onButtonTouched = {
			guard self.kids.count < 5 else {
				self.tableView.tableFooterView = UIView()
				self.tableView.reloadData()
				return
			}
			
			let kid = Kid()
			self.kids.append(kid)
			
			if self.kids.count == 5 {
				self.tableView.tableFooterView = UIView()
			}
			
			self.tableView.reloadData()
		}
		
		return view
	}
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1 + kids.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 4
		case 1...5:
			return 3
		default:
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch (indexPath.section, indexPath.row) {
		case (0, 0):
			return getTextFieldCell(placeholder: "Фамилия",
									text: nil,
									type: .firstName,
									indexPath: indexPath)
		case (0, 1):
			return getTextFieldCell(placeholder: "Имя",
									text: nil,
									type: .lastName,
									indexPath: indexPath)
		case (0, 2):
			return getTextFieldCell(placeholder: "Отчество",
									text: nil,
									type: .middleName,
									indexPath: indexPath)
		case (0, 3):
			return getTextFieldCell(placeholder: "Возраст",
									text: nil,
									type: .age,
									indexPath: indexPath)
		default:
			switch indexPath.row {
			case 0:
				return getTextFieldCell(placeholder: "Имя",
										text: nil,
										type: .firstName,
										indexPath: indexPath)
			case 1:
				return getTextFieldCell(placeholder: "Возвраст",
										text: nil,
										type: .age,
										indexPath: indexPath)
			case 2:
				return getRemoveKidCell(indexPath: indexPath)
			default:
				return UITableViewCell()
			}
		}
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return "Родитель"
		case 1...5:
			return "Ребенок \(section)"
		default:
			return nil
		}
	}
}
