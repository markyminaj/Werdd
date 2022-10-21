//
//  WordCell.swift
//  Werdd
//
//  Created by Mark Martin on 10/3/22.
//

import UIKit

class WordCell: UITableViewCell {

    private let wordAndPartStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.alignment = .leading
        sv.spacing = 10
        return sv
    }()
    
    private let wordAndDefinitionLabelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 8
        
        return sv
    }()
    
    private let wordLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.init(name: "Rubik-Bold", size: 18)
        lb.textAlignment = .left
        lb.textColor = .label
        lb.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return lb
    }()
    
    private let partsOfSpeechLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.init(name: "Rubik-Italic", size: 14)
        lb.textColor = .secondaryLabel
        lb.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return lb
    }()
    
    private let definitionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.init(name: "Rubik-Bold", size: 14)
        lb.textColor = .secondaryLabel
        lb.numberOfLines = 0
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cellReuseID")
        configureUI()
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10))
        
    }
    
    //MARK: - Only partial covers the cell, maybe only covers the contentView's content
    private func configureUI() {
        configureGradient()
        
        wordAndPartStackView.addArrangedSubview(wordLabel)
        wordAndPartStackView.addArrangedSubview(partsOfSpeechLabel)
        wordAndDefinitionLabelStackView.addArrangedSubview(wordAndPartStackView)
        wordAndDefinitionLabelStackView.addArrangedSubview(definitionLabel)
        
        contentView.addSubview(wordAndDefinitionLabelStackView)
        contentView.layer.cornerRadius = 10
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            wordAndDefinitionLabelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            wordAndDefinitionLabelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            wordAndDefinitionLabelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            

            partsOfSpeechLabel.centerYAnchor.constraint(equalTo: wordLabel.centerYAnchor),
            partsOfSpeechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 8),
        ])
    }
    
    func update(word: Word) {
        wordLabel.text = word.title.lowercased()
        partsOfSpeechLabel.text = word.partOfSpeech.lowercased()
        definitionLabel.text = word.definition.lowercased()
        
    }
    
    private func configureGradient() {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor(named: "WordViewColor1")!.cgColor, UIColor(named: "WordViewColor2")!.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.locations = [0.1,1]
        gradient.frame = CGRect(x: 10, y: 10, width: 357, height: 90) // I think this line is what needs to change ..CGRect(x: 10, y: 10, width: 357, height: 90)

        contentView.layer.insertSublayer(gradient, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
