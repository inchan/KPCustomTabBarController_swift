//
//  KPCustomTabBarController.swift
//  Besty
//
//  Created by Chans on 2017. 6. 30..
//  Copyright © 2017년 Chans. All rights reserved.
//

import Foundation
import UIKit


var kTabBarHeight: CGFloat = 50// Input the height we want to set for Tabbar here

typealias KPTabActionHandler = ( _ selectedTag: Int) -> Void


class KPCustomTabBarController: UITabBarController {
    
    open var tabBarView: KPCustomTabBarView? = nil
    
    open var isTabBarHidden = false {
        didSet{
            if isTabBarHidden == true {
                kTabBarHeight = 0
                self.tabBarView?.isHidden = true
                self.tabBar.isHidden = true
            }
            else {
                kTabBarHeight = 50
                self.tabBarView?.isHidden = false
                self.tabBar.isHidden = false
            }
            self.view.setNeedsDisplay()

        }
    }
    
    private var tabActionHandler: KPTabActionHandler? = nil

    
    // MARK: ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayCustomTabBar()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.updateCustomTabBarFrame()
    }
    
    // MARK: Display UI
    open func displayCustomTabBar() {
        
        if self.tabBarView == nil {
            self.tabBarView = KPCustomTabBarView.fromNib()
            self.view.addSubview(self.tabBarView!)
            
            self.updateCustomTabBarFrame()
            
            self.tabBarView?.btns?.forEach({ (btn) in
                btn.addTarget(self, action: #selector(btnActions), for: .touchUpInside)
            })
            
        }
    }
    
    // MARK: Frame Update
    open func updateCustomTabBarFrame() {

        self.tabBarView?.widthConstraint?.constant = self.view.frame.size.width
        self.view.layoutIfNeeded()

        // 기존 탭바위치로
        self.tabBarView?.frame.origin.y = self.tabBar.frame.origin.y
        self.tabBarView?.frame.size.width = self.view.frame.size.width
    }
    
    // MARK: Tab Button Pressed Handler
    open func tabActionHandler(_ handler : KPTabActionHandler? = nil) {
        self.tabActionHandler = handler
    }

    
    // MARK: IBActions
    
    @IBAction func btnActions(sender: UIButton) {
    
        let tag = sender.tag
        
        // handler block
        if self.tabActionHandler != nil {
            self.tabActionHandler?(tag)
        }
        
        // move selected RootViewController
        if tag == self.selectedIndex {
            if let selectedNavigationController = self.selectedViewController as? UINavigationController {
                if selectedNavigationController.viewControllers.count > 1 {
                    selectedNavigationController.popToRootViewController(animated: true)
                    
                }
                else {
                    
                }
            }
        }
        
        
        // selected
        self.selectedIndex = tag
    }
    
}

class tabbar: UITabBar {
 
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        
        super.sizeThatFits(size)
        
        return CGSize(width: size.width, height: kTabBarHeight)
    }
    
}

