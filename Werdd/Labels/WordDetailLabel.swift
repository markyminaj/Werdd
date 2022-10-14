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
        font = UIFont.systemFont(ofSize: size, weight: weight)
    }
    
    func setColor(of color: UIColor) {
        textColor = color
    }
}
