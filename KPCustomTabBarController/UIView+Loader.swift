//
//  UIView+Loader.swift
//  CustumTabbarController
//
//  Created by Chans on 2017. 7. 24..
//  Copyright © 2017년 Chans. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: - LoadNib
    
    public class func fromNib() -> Self {
        return fromNib(nibName: nil)
    }
    
    public class func fromNib(nibName: String?) -> Self {
        func fromNibHelper<T>(nibName: String?) -> T where T : UIView {
            
            let bundle = Bundle(for: T.self)
            
            let name = nibName ?? String(describing: T.self)
            
            return bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? T ?? T()
        }
        return fromNibHelper(nibName: nibName)
    }
}


