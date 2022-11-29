//
//  DirectionViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 27.11.2022.
//

import UIKit

class DirectionViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var university = University(name: "", directions: [Direction(name: "")])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
//        tableView.delegate = self
        
        title = K.VC.directions

//        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.directionCellIdentifier)
    
//        loadUniversities()
    }
}

 // MARK: - UITableViewDataSource

extension DirectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return university.directions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let direction = university.directions[indexPath.row].name
        let cell = tableView.dequeueReusableCell(withIdentifier: K.directionCellIdentifier, for: indexPath)
//        cell.delegate = self
        cell.backgroundColor = UIColor.clear
        cell.largeContentTitle = direction
        var content = cell.defaultContentConfiguration()
        
        content.text = direction
        cell.contentConfiguration = content
        return cell
    }
}
