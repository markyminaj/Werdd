//
//  WordDetailContainerView.swift
//  Werdd
//
//  Created by Mark Martin on 10/16/22.
//

import UIKit

class WordDetailContainerView: UIView {
    
    private let topText: String
    private let middleText: String?
    private let bottomText: String?
    private let color: UIColor
    
    init(
        topText: String,
        color: UIColor,
        middleText: String? = nil,
        bottomText: String? = nil)
    {
        self.topText = topText
        self.middleText = middleText ?? ""
        self.bottomText = bottomText ?? ""
        self.color = color
        
        super.init(frame: .zero)
        setupUI()
    }
    
    private let definitionStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 4
        return sv
    }()

    private let topLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelFont(with: 14, weight: .bold)
        return label
    }()

    private let middleLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelFont(with: 14, weight: .regular)
        return label
    }()

    private let bottomLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setColor(of: .white)
        label.setLabelFont(with: 14, weight: .semibold)
        label.setLabelText(with: "definition")
        return label
    }()
    
   
    override init(frame: CGRect) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        definitionStackView.addArrangedSubview(topLabel)
        definitionStackView.addArrangedSubview(middleLabel)
        definitionStackView.addArrangedSubview(bottomLabel)
        definitionStackView.addArrangedSubview(UIView())
        addSubview(definitionStackView)
        definitionStackView.isLayoutMarginsRelativeArrangement = true
        definitionStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0)
        layer.cornerRadius = 20
        definitionStackView.layer.cornerRadius = 20
        definitionStackView.constrain(within: self)
        
        topLabel.text = topText
        middleLabel.text = middleText
        middleLabel.text = middleText
        middleLabel.isHidden = middleText?.isEmpty ?? true
        bottomLabel.text = bottomText
        bottomLabel.isHidden = bottomText?.isEmpty ?? true
        
        backgroundColor = color
    }
}

