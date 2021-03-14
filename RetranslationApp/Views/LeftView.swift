//
//  RetranslatedTextView.swift
//  RetranslationApp
//
//  Created by ろーんでぃね on 2021/03/07.
//

import UIKit

class LeftView: UIView {
    
    let textView: UITextView = {
        let textView = UITextView()
        
        textView.layer.cornerRadius = 5.0
        textView.layer.masksToBounds = true
                
        return textView
    }()
    
    
    init(title: String, borderWidth: CGFloat, borderColor: CGFloat, isEditable: Bool) {
        super.init(frame: .zero)
        
        let topView: TopViews = TopViews()
        
        topView.titleLabel.text = title
        textView.layer.borderWidth = borderWidth
        textView.layer.borderColor = .init(red: borderColor, green: borderColor, blue: borderColor, alpha: 1)
        textView.isEditable = isEditable
        
        addSubview(topView)
        addSubview(textView)
        
        topView.anchor(top: topAnchor, left: leftAnchor, width: 140, height: 44, leftPadding: 12)
        textView.anchor(top: topView.bottomAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, topPadding: 8,bottomPadding: 10, leftPadding: 12,rightPadding: 82)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
