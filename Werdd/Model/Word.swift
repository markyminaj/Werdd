//
//  Word.swift
//  Werdd
//
//  Created by Mark Martin on 10/11/22.
//

import Foundation

struct Word {
    let title: String
    let partOfSpeech: String
    let definition: String
    
    init(title: String, partOfSpeech: String, definition: String) {
        self.title = title
        self.partOfSpeech = partOfSpeech
        self.definition = definition
    }
}

struct NetworkWord: Decodable {
    let word: String
    let results: [Result]
}

struct Result: Decodable {
    let definition, partOfSpeech: String?
}
