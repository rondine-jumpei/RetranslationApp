//
//  TranslationButton-Ex.swift
//  RetranslationApp
//
//  Created by ろーんでぃね on 2021/03/14.
//

import UIKit

extension UIButton {
    func buttonBehavior(valid: Bool) {
        
        if valid == true {
            backgroundColor = .white
            tintColor = .link
            layer.borderWidth = 0.2
            layer.shadowRadius = 5
            layer.shadowOpacity = 0.6
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
        } else {
            backgroundColor = .lightGray
            tintColor = .darkGray
            layer.borderWidth = 0
            layer.shadowRadius = 0
            layer.shadowOpacity = 0
            layer.shadowColor = UIColor.gray.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
}
