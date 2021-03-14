//
//  File.swift
//  RetranslationApp
//
//  Created by ろーんでぃね on 2021/03/14.
//

import Foundation
import UIKit

class KeyboardBar: UIToolbar {
    
    let flexibleItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
    let translationButton: UIBarButtonItem = UIBarButtonItem(title: "翻訳", style: UIBarButtonItem.Style.plain, target: self, action: nil)
    let cancelButton: UIBarButtonItem = UIBarButtonItem(title: "戻る", style: UIBarButtonItem.Style.plain, target: self, action: nil)

    init() {
        super.init(frame: .zero)
        
        setItems([cancelButton, flexibleItem, translationButton], animated: true)
        
        sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
