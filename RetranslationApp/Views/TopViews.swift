//
//  TopViews.swift
//  RetranslationApp
//
//  Created by ろーんでぃね on 2021/02/28.
//

import UIKit

class TopViews: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let voicePlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "speaker.wave.3")?.resize(size: .init(width: 32, height: 32)), for: .normal)
        button.backgroundColor = .white
        button.tintColor = .link
        
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 0.2
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.6
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        return button
    }()
    
    let copySentenceButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "doc.on.clipboard")?.resize(size: .init(width: 32, height: 32)), for: .normal)
        button.backgroundColor = .white
        button.tintColor = .link
        
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 0.2
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.6
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        return button
    }()
    
//    let aLabel: UILabel = {
//        let label = UILabel()
//        label.font = .boldSystemFont(ofSize: 20)
//        label.text = "aaa"
//        label.backgroundColor = .red
//        return label
//    }()
//
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, voicePlayButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal

        addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: topAnchor),
         stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
         stackView.leftAnchor.constraint(equalTo: leftAnchor),
         stackView.rightAnchor.constraint(equalTo: rightAnchor)].forEach{ $0.isActive = true}
        
        titleLabel.anchor(top: topAnchor, left: leftAnchor)
        voicePlayButton.anchor(left: titleLabel.rightAnchor, centerX: titleLabel.centerXAnchor, width: 44, height: 44)
        
//        aLabel.anchor(left: voicePlayButton.rightAnchor,centerX: titleLabel.centerXAnchor ,width: 10, height: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
