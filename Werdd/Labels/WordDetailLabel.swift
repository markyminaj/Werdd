//
//  WordDetailLabel.swift
//  Werdd
//
//  Created by Mark Martin on 10/13/22.
//

import UIKit

class WordDetailLabel: UILabel {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        numberOfLines = 3
        preferredMaxLayoutWidth = 315
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLabelText(with labelText: String) {
        text = labelText
    }
    
    func setLabelFont(with size: CGFloat, weight: UIFont.Weight) {
        if weight == UIFont.Weight.bold {
            font = UIFont.init(name: "Rubik-Bold", size: size)
        } else if weight == UIFont.Weight.semibold {
            font = UIFont.init(name: "Rubik-Semibold", size: size)
        } else {
            font = UIFont.init(name: "Rubik-Regular", size: size)
        }
        
    }
    
    func setColor(of color: UIColor) {
        textColor = color
    }
}
