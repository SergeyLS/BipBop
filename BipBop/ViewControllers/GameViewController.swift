//
//  GameViewController.swift
//  BipBop
//
//  Created by Sergey Leskov on 3/2/18.
//  Copyright © 2018 Sergey Leskov. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController {
    
    
    @IBOutlet weak var fieldBipUI: UITextField!
    @IBOutlet weak var fieldBopUI: UITextField!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    fileprivate let cellName = "Cell"
    fileprivate var rows : [Int] = []
    
    
    //==================================================
    // MARK: - General
    //==================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fieldBipUI.layer.borderWidth = 1.0
        fieldBipUI.layer.borderColor = UIColor.red.cgColor
        fieldBipUI.layer.cornerRadius = 5
        
        fieldBopUI.layer.borderWidth = 1.0
        fieldBopUI.layer.borderColor = UIColor.blue.cgColor
        fieldBopUI.layer.cornerRadius = 5

        
        self.reloadData()
    }
    
    
    //==================================================
    // MARK: - func
    //==================================================
    func reloadData() {
        self.rows = []
        
        for num in 1...11 {
            rows.append(num)
        }
        
        tableView.reloadData()
    }
    
}


//==================================================
// MARK: - extension Table view
//==================================================
extension GameViewController: UITableViewDelegate, UITableViewDataSource {
    
    //numberOfSections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rows.count
    }
    
    //cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        
        let row = rows[indexPath.row]
        cell.textLabel?.text = "\(row)"
        
        return cell
    }
    
}

