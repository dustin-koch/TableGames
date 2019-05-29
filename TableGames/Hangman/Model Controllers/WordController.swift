//
//  WordController.swift
//  TableGames
//
//  Created by Dustin Koch on 5/29/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation


class WordController {
    
    //MARK: - Singleton
    static let shared = WordController()
    
    //MARK: - Source of truth
    var wordChoices = Word().wordArray
    var word = ""
    
    //MARK: - CRUD Functions
    func drawNewWord() -> String {
        //take word of of array and set to SoT
        if let word = wordChoices.randomElement() {
            return word
        }
        return ""
    }
    
    func remove(word: String) {
        //take word out of array so it's not played again
        guard let index = wordChoices.firstIndex(of: word) else { return }
        wordChoices.remove(at: index)
    }
    
    
    
    
}//END OF CLASS
