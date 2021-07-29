//
//  TextFieldTableViewCell.swift
//  testForAlef
//
//  Created by Alexander Airumian on 28.07.2021.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

	func configure(placeholder: String, text: String?) {
		textField.placeholder = placeholder
		textField.text = text
	}
}
