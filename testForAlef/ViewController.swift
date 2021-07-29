//
//  ViewController.swift
//  testForAlef
//
//  Created by Alexander Airumian on 28.07.2021.
//

import UIKit
class ViewController: UIViewController {
    let idCell = "mailCell"
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ChildTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! ChildTableViewCell
        
        
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
//            print("Create")
//        }
//        if(indexPath.section == 0){
//            cell!.textLabel?.text = "Фамилия"
//            cell!.detailTextLabel?.text = "details text"
//
//        } else {
//            cell!.textLabel?.text = "Mail Subject"
//            cell!.detailTextLabel?.text = "details text"
//        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "Родитель"
        } else {
            return "Ребенок"
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
}

