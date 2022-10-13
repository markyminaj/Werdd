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
        lb.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        lb.textAlignment = .left
        lb.textColor = .label
        lb.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return lb
    }()
    
    private let partsOfSpeechLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont.italicSystemFont(ofSize: 14)
        lb.textColor = .secondaryLabel
        lb.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return lb
    }()
    
    private let definitionLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = UIFont(name: "Courier New", size: 14)
        lb.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lb.textColor = .secondaryLabel
        lb.numberOfLines = 3
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
    
    private func configureUI() {
        
        
        wordAndPartStackView.addArrangedSubview(wordLabel)
        wordAndPartStackView.addArrangedSubview(partsOfSpeechLabel)
        wordAndDefinitionLabelStackView.addArrangedSubview(wordAndPartStackView)
        wordAndDefinitionLabelStackView.addArrangedSubview(definitionLabel)
        
        contentView.addSubview(wordAndDefinitionLabelStackView)
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .systemOrange
        contentView.clipsToBounds = false
        
        NSLayoutConstraint.activate([
            
            wordAndDefinitionLabelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            wordAndDefinitionLabelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            wordAndDefinitionLabelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
//            wordLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            wordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
//            wordLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//            wordLabel.heightAnchor.constraint(equalToConstant: 20),
//
            partsOfSpeechLabel.centerYAnchor.constraint(equalTo: wordLabel.centerYAnchor),
            partsOfSpeechLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 8),
//
//            definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 8),
//            definitionLabel.leadingAnchor.constraint(equalTo: wordLabel.leadingAnchor),
            
            
        ])
    }
    
    func update(word: Word) {
        wordLabel.text = word.title.lowercased()
        partsOfSpeechLabel.text = word.partOfSpeech.lowercased()
        definitionLabel.text = word.definition.lowercased()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
