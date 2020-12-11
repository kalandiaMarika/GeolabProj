//
//  ViewController.swift
//  tableView
//
//  Created by Marika Kalandia on 10.12.20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var contactList: [Contact] = {
        (0...50).map { _ in Contact() }
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }


}

extension ViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        "Section \(section)"
//    }
//
//    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
//        "Footer \(section)"
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
//        (cell as? ListTableViewCell)?.titleLabel.text = "current index: \(indexPath)"
//
//        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let currentName = self.contactList[indexPath.row]
        (cell as? ListTableViewCell)?.contact = currentName
        
//        (cell as? ListTableViewCell)?.titleLabel.text = currentName.name
            //"current index: \(indexPath.section) - \(indexPath.row)"
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath)
        let newContact = Contact(name: "New contact \(indexPath)")
//        cell?.contentView.backgroundColor = UIColor.purple
//        (cell as? ListTableViewCell)?.contact = newContact
        self.contactList[indexPath.row] = newContact
//        tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .top)
    }
    
}
