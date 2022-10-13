//
//  WordDetailLabelStackView.swift
//  Werdd
//
//  Created by Mark Martin on 10/12/22.
//

import UIKit

class WordDetailLabelStackView: UIStackView {

    var topLabel: UILabel
    var middleLabel: UILabel?
    var bottomLabel: UILabel
    
    init(topLabel: UILabel, middleLabel: UILabel? = nil, bottomLabel: UILabel) {
        self.topLabel = topLabel
        self.middleLabel = middleLabel
        self.bottomLabel = bottomLabel
        
        super.init(frame: .zero)
        
        configureLabels()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabels() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        middleLabel?.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        topLabel.textColor = .black
        topLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        if let middleLabel = middleLabel {
            
            middleLabel.textColor = .black
            middleLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            middleLabel.numberOfLines = 3
            middleLabel.lineBreakMode = .byTruncatingTail
            middleLabel.preferredMaxLayoutWidth = 315
        }
        
        bottomLabel.textColor = .white
        bottomLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }
    
}
