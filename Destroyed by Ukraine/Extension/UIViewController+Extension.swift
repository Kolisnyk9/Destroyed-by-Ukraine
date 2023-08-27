//
//  UIViewController+Extension.swift
//  Destroyed by Ukraine
//
//  Created by kolisnyk9 on 27/08/2023.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
    }
}
