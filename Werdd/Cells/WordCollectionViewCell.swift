//
//  WordCollectionViewCell.swift
//  Werdd
//
//  Created by Mark Martin on 10/19/22.
//

import UIKit

class WordCollectionViewCell: UICollectionViewCell {
    static let identifier = "collectionCell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Rubik-Bold", size: 16)
        label.textColor = .black
        label.minimumScaleFactor = 0.3
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let partofSpeechLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Rubik-Italic", size: 14)
        label.textColor = .secondaryLabel
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
        
    }()
    
    private let definitionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.init(name: "Rubik-Regular", size: 14)
        lb.textColor = .secondaryLabel
        lb.contentScaleFactor = 0.2
        lb.lineBreakMode = .byWordWrapping
        lb.numberOfLines = 5
        return lb
    }()
    
    private let topHStack: UIStackView = {
        let hstack = UIStackView()
        hstack.axis = .horizontal
        hstack.distribution = .fill
        hstack.spacing = 8
        hstack.alignment = .center
        hstack.translatesAutoresizingMaskIntoConstraints = false
        hstack.minimumContentSizeCategory = UIContentSizeCategory.extraSmall
        return hstack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        configureGradient()
        
        contentView.backgroundColor = .clear
        contentView.addSubview(stackView)
        
        topHStack.addArrangedSubview(titleLabel)
        topHStack.addArrangedSubview(partofSpeechLabel)
        
        stackView.addArrangedSubview(topHStack)
        stackView.addArrangedSubview(definitionLabel)
        
        contentView.contentScaleFactor = 0.4
        contentView.layer.cornerRadius = 10
        
        
        NSLayoutConstraint.activate([
            
            topHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            topHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            topHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            topHStack.bottomAnchor.constraint(equalTo: definitionLabel.topAnchor, constant: -4),
            
            definitionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            definitionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    func configureCell(word: String, partOfSpeech: String?, definition: String?) {
        titleLabel.text = word.lowercased()
        partofSpeechLabel.text = partOfSpeech?.lowercased()
        definitionLabel.text = definition?.lowercased()
    }
    
    private func configureGradient() {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.cornerRadius = 10
        
        gradient.colors = [
            UIColor(named: "WordViewColor1")!.cgColor, UIColor(named: "WordViewColor2")!.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.locations = [0.1,1]
        gradient.frame = contentView.bounds // I think this line is what needs to change ..CGRect(x: 10, y: 10, width: 357, height: 90)

        contentView.layer.insertSublayer(gradient, at: 0)
        
        
    }
    
}
