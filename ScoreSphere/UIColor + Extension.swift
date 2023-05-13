//
//  UIColor + Extension.swift
//  ScoreSphere
//
//  Created by macbook pro on 13.05.2023.
//

import UIKit

extension UIColor {
    
    static func setColorName(name: String) -> UIColor? {
        
        let selector = Selector("\(name)Color")
        if UIColor.self.responds(to: selector) {
            let color = UIColor.self.perform(selector).takeUnretainedValue()
            return (color as? UIColor)
        } else {
            return nil
        }
    }
    
}
