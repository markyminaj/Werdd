//
//  WordDetailViewController.swift
//  Werdd
//
//  Created by Mark Martin on 10/11/22.
//

import UIKit

class WordDetailViewController: UIViewController {
    
    var wordDetailViews: [UIView] = []
    var word: Word!
    
    //MARK: Initialize Stack View
    let detailStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .darkGray
        sv.spacing = 20
        return sv
    }()
    
    let definitionStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 4
        return sv
    }()
    
    //MARK: Initialize Views and Labels
    let definitionView = UIView()
    let synonymView = UIView()
    let antonymView = UIView()
    let exampleView = UIView()
    let partsOfSpeechLabel = UILabel()
    let definitionLabel = UILabel()
    let definitionTitleLabel = UILabel()
    let synonymLabel = UILabel()
    let synonymTitleLabel = UILabel()
    let antonymLabel = UILabel()
    let antonymTitleLabel = UILabel()
    let exampleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutUI()
        configureNavigationBar()
        configureLabels()
        configureDefinitionView()
    }
    
    private func configureNavigationBar() {
        title = word.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func layoutUI() {
        let padding: CGFloat = 8
        view.addSubview(detailStackView)
        detailStackView.isLayoutMarginsRelativeArrangement = true
        detailStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)

        NSLayoutConstraint.activate([
            detailStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            detailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            detailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            detailStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),

        ])
        
        wordDetailViews = [definitionView, synonymView, antonymView, exampleView]
        
        for detailView in wordDetailViews {
            print(detailView)
            detailStackView.addArrangedSubview(detailView)
            detailView.translatesAutoresizingMaskIntoConstraints = false
            detailView.layer.cornerRadius = 12
        }
        
        definitionView.backgroundColor = .systemCyan
        synonymView.backgroundColor = .systemGreen
        antonymView.backgroundColor = .systemPink
        exampleView.backgroundColor = .systemOrange
        
    }
    
    private func configureLabels() {
        
        partsOfSpeechLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        synonymLabel.translatesAutoresizingMaskIntoConstraints = false
        synonymTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        antonymLabel.translatesAutoresizingMaskIntoConstraints = false
        antonymTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        exampleLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        partsOfSpeechLabel.text = word.partOfSpeech
//        partsOfSpeechLabel.textColor = .black
//        partsOfSpeechLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
//
//
//        definitionLabel.text = word.definition
//        definitionLabel.textColor = .black
//        definitionLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//        definitionLabel.numberOfLines = 3
//        definitionLabel.lineBreakMode = .byTruncatingTail
//
//        definitionLabel.preferredMaxLayoutWidth = 315
//
//        definitionTitleLabel.textColor = .white
//        definitionTitleLabel.text = "definition"
//        definitionTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        let definitionLabels = WordDetailLabelStackView(topLabel: <#T##UILabel#>, bottomLabel: <#T##UILabel#>)
       
        
        
        synonymLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        synonymLabel.text = "This is a synonym"
        
        synonymTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        synonymTitleLabel.text = "synonym"
        
        antonymLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        antonymLabel.text = "This is an antonym"
        
        antonymTitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        antonymTitleLabel.text = "antonym"
        
        exampleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    }
    
    private func configureDefinitionView() {
        definitionStackView.addArrangedSubview(partsOfSpeechLabel)
        definitionStackView.addArrangedSubview(definitionLabel)
        definitionStackView.addArrangedSubview(definitionTitleLabel)
        definitionView.addSubview(definitionStackView)
        
        NSLayoutConstraint.activate([
            definitionStackView.topAnchor.constraint(equalTo: definitionView.topAnchor, constant: 20),
            definitionStackView.leadingAnchor.constraint(equalTo: definitionView.leadingAnchor, constant: 12),
        ])
    
        
    }
}
