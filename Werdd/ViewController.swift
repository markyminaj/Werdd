//
//  ViewController.swift
//  Werdd
//
//  Created by Mark Martin on 10/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    let wordLabel = UILabel()
    let partsOfSpeechLabel = UILabel()
    let definitionLabel = UILabel()
    let wordView = UIView()
    let randomWordButton = UIButton(type: .custom)
    
    
    let tableView = UITableView()
    let cellReuseID = "cellReuseID"
    
    let padding: CGFloat = 12
    
    var wordArray = [Word]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Werdd"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let word1 = Word(title: "Jump", partOfSpeech: "verb", definition: "push oneself off a surface and into the air by using the muscles in one's legs and feet.")
        let word2 = Word(title: "Field", partOfSpeech: "noun", definition: "vast plane of land with grass")
        let word3 = Word(title: "Magical", partOfSpeech: "adjective", definition: "wizardy of a natural kind, usually with illusion or sleight of hand")
        wordArray.append(word1)
        wordArray.append(word2)
        wordArray.append(word3)
        addSubViews()
        style()
        configureTableView()
        configureConstraints()
        
        
    }
    
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WordCell.self, forCellReuseIdentifier: cellReuseID)
        tableView.backgroundColor = .systemBackground
        tableView.layer.cornerRadius = 12
    }
    
    
    private func addSubViews() {
        view.addSubview(wordView)
        view.addSubview(wordLabel)
        view.addSubview(partsOfSpeechLabel)
        view.addSubview(definitionLabel)
        view.addSubview(randomWordButton)
        view.addSubview(tableView)
    }
    
    private func style() {
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        partsOfSpeechLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        wordView.translatesAutoresizingMaskIntoConstraints = false
        randomWordButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        wordView.backgroundColor = .systemCyan
        wordView.layer.cornerRadius = 20
        
        wordLabel.text = "Programming"
        wordLabel.font = UIFont.boldSystemFont(ofSize: 30)
        wordLabel.lineBreakMode = .byCharWrapping
        wordLabel.numberOfLines = 3
        wordLabel.minimumScaleFactor = 20
        
        partsOfSpeechLabel.text = "adjective"
        partsOfSpeechLabel.font = UIFont.italicSystemFont(ofSize: 20)
        
        definitionLabel.text = "This is some definition of the word programming that may or may not be true this is just filler text"
        definitionLabel.font = UIFont(name: "Courier New", size: 14)
        definitionLabel.numberOfLines = .max
        definitionLabel.lineBreakMode = .byTruncatingTail
        
        randomWordButton.tintColor = .white
        randomWordButton.layer.cornerRadius = 12
        randomWordButton.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        randomWordButton.addTarget(self, action: #selector(randomWord), for: .touchUpInside)
        var config = UIButton.Configuration.borderless()
        config.image = UIImage(systemName: "arrow.clockwise.circle")
        randomWordButton.configuration = config
        
       
        
    }
    
    @objc private func randomWord() {
        let word = wordArray.randomElement()
        wordLabel.text = word?.title
        definitionLabel.text = word?.definition
        partsOfSpeechLabel.text = word?.partOfSpeech
    }
    
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            wordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            wordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            wordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            wordView.heightAnchor.constraint(equalToConstant: 200),
            
            wordLabel.topAnchor.constraint(equalTo: wordView.topAnchor, constant: padding),
            wordLabel.leadingAnchor.constraint(equalTo: wordView.leadingAnchor, constant: padding),
            wordLabel.widthAnchor.constraint(equalToConstant: 300),
            wordLabel.heightAnchor.constraint(equalToConstant: 50),
           
            partsOfSpeechLabel.topAnchor.constraint(equalTo: wordLabel.centerYAnchor, constant: -8),
            partsOfSpeechLabel.trailingAnchor.constraint(equalTo: wordView.trailingAnchor, constant: -70),
            
            definitionLabel.topAnchor.constraint(equalTo: wordLabel.bottomAnchor, constant: 4),
            definitionLabel.leadingAnchor.constraint(equalTo: wordLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: -padding),
            definitionLabel.widthAnchor.constraint(equalToConstant: 350),
            
            randomWordButton.bottomAnchor.constraint(equalTo: wordView.bottomAnchor, constant: -10),
            randomWordButton.trailingAnchor.constraint(equalTo: wordView.trailingAnchor, constant: -20),
            randomWordButton.heightAnchor.constraint(equalToConstant: 50),
            randomWordButton.widthAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: wordView.bottomAnchor, constant: padding),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ])
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as! WordCell

        let word = wordArray[indexPath.row]
        
        cell.layer.cornerRadius = 8
        cell.selectionStyle = .none
        cell.update(word: word)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = WordDetailViewController()
        detailVC.word = wordArray[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}



