//
//  RootViewController.swift
//  Example
//
//  Created by Chans on 2017. 7. 27..
//  Copyright © 2017년 KangC. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var openButton: UIButton?

    @IBOutlet weak var tabBarView: UIView?
    
    @IBOutlet weak var backgroundMenuView: UIView?
    
    @IBOutlet weak var tabBarViewLeftConstraint: NSLayoutConstraint?
}

extension RootViewController {
    
    // MARK: IBAction
    
    @IBAction func openButtonPressed(sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            self.openMenu()
        }
        else {
            self.closeMenu()
        }
    }

    // Open
    func openMenu() {
        
        let y = self.view.frame.width * 0.7 // 70%
        
        self.tabBarViewLeftConstraint?.constant = y
        UIView.animate(withDuration: 0.25) {  self.view.layoutIfNeeded() }
    }
    
    // Close
    func closeMenu() {
        
        self.tabBarViewLeftConstraint?.constant = 0
        UIView.animate(withDuration: 0.25) {  self.view.layoutIfNeeded() }
    }
}
