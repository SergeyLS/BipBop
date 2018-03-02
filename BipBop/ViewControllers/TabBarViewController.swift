//
//  TabBarViewController.swift
//  BipBop
//
//  Created by Sergey Leskov on 3/2/18.
//  Copyright © 2018 Sergey Leskov. All rights reserved.
//

import UIKit

class TabBarViewController: BaseViewController {
    
    
    @IBOutlet weak var playButtonUI: UIButton!
    @IBOutlet weak var explanationButtonUI: UIButton!
    
    @IBOutlet weak var containerPlayUI: UIView!
    @IBOutlet weak var containerExplanationUI: UIView!
    
    
    fileprivate  var currentContainer: ContainerTab = .play {
        didSet {
            switch currentContainer {
            case .play:
                playButtonUI.alpha = 1
                explanationButtonUI.alpha = 0.3
            case .explanation:
                playButtonUI.alpha = 0.3
                explanationButtonUI.alpha = 1
            }
            self.updateContainer()
        }
    }
    
    //==================================================
    // MARK: - General
    //==================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentContainer = .play
    }
    
    
    //==================================================
    // MARK: - func
    //==================================================
    fileprivate func updateContainer()  {
        switch currentContainer {
        case .play:
            containerPlayUI.alpha = 1
            containerExplanationUI.alpha = 0
        case .explanation:
            containerPlayUI.alpha = 0
            containerExplanationUI.alpha = 1
        }
    }
    
    //==================================================
    // MARK: - action
    //==================================================
    @IBAction func playAction(_ sender: UIButton) {
        self.currentContainer = .play
    }
    
    @IBAction func explanationAction(_ sender: UIButton) {
        self.currentContainer = .explanation
    }
    
}
