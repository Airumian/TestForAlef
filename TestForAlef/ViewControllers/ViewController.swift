//
//  ViewController.swift
//  testForAlef
//
//  Created by Alexander Airumian on 28.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
    }

	func setupTableView() {
		tableView.dataSource = self
		tableView.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil),
						   forCellReuseIdentifier: "TextFieldTableViewCell")
	}

	func getTextFieldCell(placeholder: String,
						  text: String?,
						  indexPath: IndexPath) -> TextFieldTableViewCell {
		guard let cell = tableView?.dequeueReusableCell(
				withIdentifier: "TextFieldTableViewCell",
				for: indexPath) as? TextFieldTableViewCell
		else { return TextFieldTableViewCell() }

		cell.configure(placeholder: placeholder, text: text)

		return cell
	}
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0:
			return 4
		case 1...5:
			return 2
		default:
			return 0
		}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch (indexPath.section, indexPath.row) {
		case (0, 0):
			return getTextFieldCell(placeholder: "Фамилия", text: nil, indexPath: indexPath)
		case (0, 1):
			return getTextFieldCell(placeholder: "Имя", text: nil, indexPath: indexPath)
		case (0, 2):
			return getTextFieldCell(placeholder: "Отчество", text: nil, indexPath: indexPath)
		case (0, 3):
			return getTextFieldCell(placeholder: "Возвраст", text: nil, indexPath: indexPath)
		default:
			return UITableViewCell()
		}
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return "Родитель"
		case 1...5:
			return "Ребенок"
		default:
			return nil
		}
    }
}

