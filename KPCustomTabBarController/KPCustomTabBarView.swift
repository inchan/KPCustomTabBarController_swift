//
//  KPCustomTabBarView.swift
//  Besty
//
//  Created by Chans on 2017. 6. 30..
//  Copyright © 2017년 Chans. All rights reserved.
//

import Foundation
import UIKit

public class KPCustomTabBarView: UIView {
 
    @IBOutlet var widthConstraint: NSLayoutConstraint?
    
    @IBOutlet var leftViewHighlighted: NSLayoutConstraint?
    
    @IBOutlet var btns: [UIButton]?
    
    @IBOutlet weak var viewHighlighted: UIView?
    
 
    // MARK:
    
    @IBAction func btnActions(sender: UIButton) {
    
        self.leftViewHighlighted?.constant = sender.frame.origin.x
        
        self.btns?.forEach({ (btn) in
            btn.isSelected = btn == sender
        })
    }

}
