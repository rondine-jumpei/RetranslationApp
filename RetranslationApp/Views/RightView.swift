//
//  TranslatedTextView.swift
//  RetranslationApp
//
//  Created by ろーんでぃね on 2021/02/28.
//

import UIKit

class RightView: UIView {
    
    let textView: UITextView = {
        let textView = UITextView()
        
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        textView.layer.cornerRadius = 5.0
        textView.layer.masksToBounds = true
        
        textView.isEditable = false
        
        return textView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        let topView: TopViews = TopViews()
        
        topView.titleLabel.text = "翻訳後"
                
        addSubview(topView)
        addSubview(textView)
        
        topView.anchor(top: topAnchor, right: rightAnchor,width: 120, height: 44, rightPadding: 8)
        textView.anchor(top: topView.bottomAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 8,bottomPadding: 10, leftPadding: 82,rightPadding: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
