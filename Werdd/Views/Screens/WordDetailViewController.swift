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
    
    init(with word: Word) {
        super.init(nibName: nil, bundle: nil)
        self.word = word
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Initialize Stack Views
    let detailStackView: UIStackView = { //Main Stack view to hold the 4 Views
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .darkGray
        sv.spacing = 20
        return sv
    }()
    
    let definitionStackView: UIStackView = { // Top View Container
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 4
        return sv
    }()
    
    
    let synonymStackView: UIStackView = { // 2nd View Container
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 4
        return sv
    }()
    
    let antonymStackView: UIStackView = { // 3rd View Container
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 4
        return sv
    }()
    
    let exampleStackView: UIStackView = { // 4th View Container
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
    
    let partsOfSpeechLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelFont(with: 14, weight: .bold)
        return label
    }()
    
    let definitionLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelFont(with: 14, weight: .regular)
        return label
    }()
    
    let definitionTitleLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setColor(of: .white)
        label.setLabelFont(with: 14, weight: .semibold)
        label.setLabelText(with: "definition")
        return label
    }()
    
    let synonymLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelFont(with: 14, weight: .regular)
        return label
    }()
    
    let synonymTitleLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelText(with: "synonyms")
        label.setLabelFont(with: 14, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let antonymLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelFont(with: 14, weight: .regular)
        return label
    }()
    
    let antonymTitleLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelText(with: "antonyms")
        label.setLabelFont(with: 14, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let exampleLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelFont(with: 14, weight: .regular)
        return label
    }()
    
    let exampleTitleLabel: WordDetailLabel = {
        let label = WordDetailLabel()
        label.setLabelFont(with: 14, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutUI()
        configureNavigationBar()
        configureLabelTexts()
        configureDefinitionView()
        configureSynonymView()
        configureAntonymView()
        configureExampleView()
    }
    
    private func configureNavigationBar() {
        title = word.title
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
        
        //MARK: Similar properties for all container views, so use array and loop
        wordDetailViews = [definitionView, synonymView, antonymView, exampleView]
        for detailView in wordDetailViews {
            detailStackView.addArrangedSubview(detailView)
            detailView.translatesAutoresizingMaskIntoConstraints = false
            detailView.layer.cornerRadius = 12
        }
        
        
        definitionView.addSubview(definitionStackView)
        synonymView.addSubview(synonymStackView)
        antonymView.addSubview(antonymStackView)
        exampleView.addSubview(exampleStackView)
        
        //MARK: Placeholder Colors
        definitionView.backgroundColor = .systemCyan
        synonymView.backgroundColor = .systemGreen
        antonymView.backgroundColor = .systemPink
        exampleView.backgroundColor = .systemOrange
    }
    
    //MARK: Todo - Create Synonyms, Antonyms, Examples, then set to labels
    private func configureLabelTexts() {
        partsOfSpeechLabel.setLabelText(with: word.partOfSpeech)
        definitionLabel.setLabelText(with: word.definition)
        synonymLabel.setLabelText(with: "These are placeholder synonyms")
        antonymLabel.setLabelText(with: "These are placeholder antonyms")
        exampleLabel.setLabelText(with: "This is an example sentence")
    }

    
    private func configureDefinitionView() {
        definitionStackView.addArrangedSubview(partsOfSpeechLabel)
        definitionStackView.addArrangedSubview(definitionLabel)
        definitionStackView.addArrangedSubview(definitionTitleLabel)
        definitionView.addSubview(definitionStackView)

        NSLayoutConstraint.activate([
            definitionStackView.topAnchor.constraint(equalTo: definitionView.topAnchor, constant: 8),
            definitionStackView.leadingAnchor.constraint(equalTo: definitionView.leadingAnchor, constant: 12),
        ])
        
        definitionTitleLabel.bottomAnchor.constraint(equalTo: definitionView.bottomAnchor, constant: -8).isActive = true
    }
    
    private func configureSynonymView() {
        synonymStackView.addArrangedSubview(synonymLabel)
        synonymStackView.addArrangedSubview(synonymTitleLabel)
        synonymView.addSubview(synonymStackView)

        NSLayoutConstraint.activate([
            synonymStackView.topAnchor.constraint(equalTo: synonymView.topAnchor, constant: 20),
            synonymStackView.leadingAnchor.constraint(equalTo: synonymView.leadingAnchor, constant: 12),
        ])
    
        synonymTitleLabel.bottomAnchor.constraint(equalTo: synonymView.bottomAnchor, constant: -8).isActive = true
    }
    
    private func configureAntonymView() {
        antonymStackView.addArrangedSubview(antonymLabel)
        antonymStackView.addArrangedSubview(antonymTitleLabel)
        antonymView.addSubview(antonymStackView)

        NSLayoutConstraint.activate([
            antonymStackView.topAnchor.constraint(equalTo: antonymView.topAnchor, constant: 20),
            antonymStackView.leadingAnchor.constraint(equalTo: antonymView.leadingAnchor, constant: 12),
        ])
        
        antonymTitleLabel.bottomAnchor.constraint(equalTo: antonymView.bottomAnchor, constant: -8).isActive = true
    }
    
    private func configureExampleView() {
        exampleStackView.addArrangedSubview(exampleLabel)
        exampleStackView.addArrangedSubview(exampleTitleLabel)
        exampleView.addSubview(exampleStackView)

        NSLayoutConstraint.activate([
            exampleStackView.topAnchor.constraint(equalTo: exampleView.topAnchor, constant: 20),
            exampleStackView.leadingAnchor.constraint(equalTo: exampleView.leadingAnchor, constant: 12),
        ])
        
        exampleTitleLabel.bottomAnchor.constraint(equalTo: exampleView.bottomAnchor, constant: -8).isActive = true
    }
}
