//
//  ViewController.swift
//  Werdd
//
//  Created by Mark Martin on 10/3/22.
//

import UIKit

class WordViewController: UIViewController {
    
    let wordLabel = UILabel()
    let partsOfSpeechLabel = UILabel()
    let definitionLabel = UILabel()
    let wordView = UIView()
    let randomWordButton = UIButton(type: .custom)
    
    let cellgradient = CAGradientLayer()
    
    
    let tableView = UITableView()
    let cellReuseID = "cellReuseID"
    
    let padding: CGFloat = 12
    
    var wordArray = [Word]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundColor()
        configureWordViewBackgroundColor()
        configureNavigationBar()
        configureArrayData()
        addSubViews()
        configureTableView()
        configureConstraints()
        style()
        configureRandomButton()
    }
    
    
    
    private func configureBackgroundColor() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(named: "BackgroundGradientColor1")!.cgColor, UIColor(named: "BackgroundGradientColor2")!.cgColor]
        gradientLayer.frame =  view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    private func configureWordViewBackgroundColor() {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            UIColor(named: "WordViewColor1")!.cgColor, UIColor(named: "WordViewColor2")!.cgColor
        ]
        gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.locations = [0.1,1]
        gradient.frame = CGRect(x: 0, y: 0, width: 369, height: 200)
        wordView.layer.addSublayer(gradient)
    }
    
    
    private func configureNavigationBar() {
        title = "Werdd 📖"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func configureArrayData() {
        let word1 = Word(title: "Jump", partOfSpeech: "verb", definition: "push oneself off a surface and into the air by using the muscles in one's legs and feet.")
        let word2 = Word(title: "Field", partOfSpeech: "noun", definition: "vast plane of land with grass")
        let word3 = Word(title: "Magical", partOfSpeech: "adjective", definition: "wizardy of a natural kind, usually with illusion or sleight of hand")
        wordArray.append(contentsOf: [word1, word2, word3])
    }
    
    private func addSubViews() {
        view.addSubview(wordView)
        view.addSubview(wordLabel)
        view.addSubview(partsOfSpeechLabel)
        view.addSubview(definitionLabel)
        view.addSubview(randomWordButton)
        view.addSubview(tableView)
    }
    
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WordCell.self, forCellReuseIdentifier: cellReuseID)
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 12
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    private func configureAutoMasks() {
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        partsOfSpeechLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        wordView.translatesAutoresizingMaskIntoConstraints = false
        randomWordButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func style() {
        
        
        configureWordViewBackgroundColor()
        configureAutoMasks()
        
        wordView.layer.cornerRadius = 20
        wordView.layer.borderWidth = 3
        wordView.clipsToBounds = true
        wordView.layer.borderColor = .init(gray: 2.0, alpha: 0.8)
        wordView.backgroundColor = .systemRed
        
        wordLabel.text = "Programming"
        wordLabel.font = UIFont.init(name: "Rubik-Bold", size: 20)
        
        wordLabel.lineBreakMode = .byCharWrapping
        wordLabel.numberOfLines = 3
        wordLabel.minimumScaleFactor = 20
        
        partsOfSpeechLabel.text = "adjective"
        partsOfSpeechLabel.font = UIFont.init(name: "Rubik-Italic", size: 18)
        
        definitionLabel.text = "This is some definition of the word programming that may or may not be true this is just filler text"
        definitionLabel.font = UIFont.init(name: "Rubik-Regular", size: 18)
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
          fetchRandomWord()
    }
    
    private func configureRandomButton() {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: "arrow.clockwise.circle", withConfiguration: largeConfig)
        randomWordButton.setImage(largeBoldDoc, for: .normal)
    }
    
    private func fetchRandomWord() {
        self.showLoadingView()
        let headers = [
            "X-RapidAPI-Key": "387f4a1a63msh8baae1fe770db61p183b64jsnebef364836ba",
            "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                print(error ?? "")
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse ?? "")
                
                guard let data = data else {
                    print("Bad decodable data, cannot convert")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData =  try decoder.decode(NetworkWord.self, from: data)
                    DispatchQueue.main.async {
                        self.dismissLoadingView()
                        self.wordLabel.text = decodedData.word
                        let definition = decodedData.results[0].definition
                        let partofspeech = decodedData.results[0].partOfSpeech
                        self.definitionLabel.text = definition
                        self.partsOfSpeechLabel.text = partofspeech
                    }
                    
                    
                } catch {
                    print("Bad decoding")
                    DispatchQueue.main.async {
                        self.showBadDecodingAlert()
                        self.dismissLoadingView()
                    }
                }
            }
        })

        dataTask.resume()
    }
    
    private func showBadDecodingAlert() {
        let alertController = UIAlertController(title: "Oops! There was a problem", message: "Unable to retrieve word data. Please try again.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            print("Ok pressed")
        })
        present(alertController, animated: true, completion: nil)
    }
    
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            wordView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            wordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            wordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            wordView.heightAnchor.constraint(equalToConstant: 200),
            wordView.widthAnchor.constraint(equalToConstant: 350),
            
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


extension WordViewController: UITableViewDelegate, UITableViewDataSource {
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
        let word = wordArray[indexPath.row]
        navigationController?.pushViewController(WordDetailViewController(with: word), animated: true)
    }
}



