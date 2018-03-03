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
    
    fileprivate var bip = Constants.Default.bip
    fileprivate var bop = Constants.Default.bop
    
    //==================================================
    // MARK: - General
    //==================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fieldBipUI.layer.borderWidth = 1.0
        self.fieldBipUI.layer.borderColor = Constants.Colors.red.cgColor
        self.fieldBipUI.layer.cornerRadius = 5
        
        self.fieldBopUI.layer.borderWidth = 1.0
        self.fieldBopUI.layer.borderColor = Constants.Colors.blue.cgColor
        self.fieldBopUI.layer.cornerRadius = 5
        
        self.reloadData()
    }
    
    
    //==================================================
    // MARK: - func
    //==================================================
    func reloadData() {
        
        self.fieldBipUI.text = String(self.bip)
        self.fieldBopUI.text = String(self.bop)
        
        self.rows = []
        
        for num in 1...1000 {
            self.rows.append(num)
        }
        
        self.tableView.reloadData()
    }
    
    func changeBipBop()  {
        if let text = fieldBipUI.text,
            let newBip = Int(text) {
            self.bip = (newBip == 0) ? Constants.Default.bip: newBip
        } else {
             self.bip = Constants.Default.bip
        }
        
        if let text = fieldBopUI.text,
            let newBop = Int(text) {
            self.bop = (newBop == 0) ? Constants.Default.bop: newBop
        } else {
            self.bop = Constants.Default.bop
        }
        
        self.reloadData()
    }
    
    @IBAction func bipChangedAction(_ sender: UITextField) {
        if sender.text?.count == 1 {
            self.changeBipBop()
            sender.resignFirstResponder()
        }
    }
    
    @IBAction func bopChangedAction(_ sender: UITextField) {
        if sender.text?.count == 1 {
            self.changeBipBop()
            sender.resignFirstResponder()
            
        }
    }
    
    
    @IBAction func bipBegin(_ sender: UITextField) {
        sender.text = ""
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
        
        return self.rows.count
    }
    
    //cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellName, for: indexPath)
        
        let row = self.rows[indexPath.row]
        
        var comment = ""
        if row % self.bip == 0 {
            comment += "Bip "
        }
        if row % self.bop == 0 {
            comment += "Bop"
        }
        
        cell.textLabel?.text = "\(row) \(comment)"
        
        return cell
    }
    
}

