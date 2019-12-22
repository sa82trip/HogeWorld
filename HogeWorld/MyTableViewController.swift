//
//  MyTableViewController.swift
//  HogeWorld
//
//  Created by GJS on 2019/12/21.
//  Copyright © 2019 GJS. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController {
    
    @IBOutlet weak var tableView2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView2.delegate = self
        tableView2.dataSource = self
    }
    
    
}

extension MyTableViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "hi: \(indexPath.row)"
        cell.imageView?.image = UIImage(named: "testImage")
        
        return cell
    }
    
    
}
