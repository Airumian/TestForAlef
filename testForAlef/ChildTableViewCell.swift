//
//  ChildTableViewCell.swift
//  testForAlef
//
//  Created by Alexander Airumian on 28.07.2021.
//

import UIKit

class ChildTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ChildTf: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
