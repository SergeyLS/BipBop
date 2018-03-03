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
    @IBOutlet weak var topViewUI: UIView!
    
    fileprivate  var currentContainer: ContainerTab = .play {
        didSet {
            switch currentContainer {
            case .play:
                self.playButtonUI.alpha = 1
                self.explanationButtonUI.alpha = 0.3
                
            case .explanation:
                self.playButtonUI.alpha = 0.3
                self.explanationButtonUI.alpha = 1
            }
            self.updateContainer()
        }
    }
    
    //==================================================
    // MARK: - General
    //==================================================
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topViewUI.backgroundColor = Constants.Colors.blue
        
        self.currentContainer = .play
    }
    
    
    //==================================================
    // MARK: - func
    //==================================================
    fileprivate func updateContainer()  {
        switch currentContainer {
        case .play:
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                self?.containerPlayUI.alpha = 1
                self?.containerExplanationUI.alpha = 0
            })
        case .explanation:
            UIView.animate(withDuration: 0.5, animations: { [weak self] in
                self?.containerPlayUI.alpha = 0
                self?.containerExplanationUI.alpha = 1
            })
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
