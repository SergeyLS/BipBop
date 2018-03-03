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
        let colorTop =  Constants.Colors.blue.cgColor
        let colorBottom = Constants.Colors.red.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
      }
}

