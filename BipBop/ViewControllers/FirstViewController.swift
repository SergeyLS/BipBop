//
//  FirstViewController.swift
//  BipBop
//
//  Created by Sergey Leskov on 3/2/18.
//  Copyright © 2018 Sergey Leskov. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {
    
    
    @IBOutlet weak var centerViewUI: UIView!
    
    fileprivate let segueSecond = "second"
    
    //==================================================
    // MARK: - General
    //==================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.centerViewUI.layer.cornerRadius = self.centerViewUI.layer.bounds.height / 2
        self.setGradientBackground()
        
        
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: segueSecond, sender: nil)
    }
    
    fileprivate func setGradientBackground() {
        let colorTop =  UIColor(red: 99.0/255.0, green: 114.0/255.0, blue: 241.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 201.0/255.0, green: 70.0/255.0, blue: 234.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
      }
}

