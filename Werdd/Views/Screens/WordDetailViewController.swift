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
    

    //MARK: Initialize Views
    let definitionView = UIView()
    let synonymView = UIView()
    let antonymView = UIView()
    let exampleView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        layoutUI()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        title = word.title
    }
    
    private func layoutUI() {
        let definitionView = WordDetailContainerView(topText: word.partOfSpeech, color: .systemCyan, middleText: word.definition, bottomText: "definition")
        let synonymView = WordDetailContainerView(topText: "this is a synonym", color: .systemGreen, bottomText: "synonyms")
        let antonymView = WordDetailContainerView(topText: "these are antonyms", color: .systemPink, bottomText: "antonyms")
        let exampleView = WordDetailContainerView(topText: "This is an example sentence", color: .systemPurple)
        
        view.addSubview(detailStackView)
        detailStackView.isLayoutMarginsRelativeArrangement = true
        detailStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        
        detailStackView.constrain(within: view)
        
        
        detailStackView.addArrangedSubview(definitionView)
        detailStackView.addArrangedSubview(synonymView)
        detailStackView.addArrangedSubview(antonymView)
        detailStackView.addArrangedSubview(exampleView)
    }
}
