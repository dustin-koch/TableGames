//
//  HangmanViewController.swift
//  TableGames
//
//  Created by Dustin Koch on 5/29/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var jailImageView: UIImageView!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var countdownValueLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstLetterLabel: UILabel!
    @IBOutlet weak var secondLetterLabel: UILabel!
    @IBOutlet weak var thirdLetterLabel: UILabel!
    @IBOutlet weak var fourthLetterLabel: UILabel!
    @IBOutlet weak var dashesStackView: UIStackView!
    
    //MARK: - Properties
    var word = ""
    var count = 5
    var jailOpacity = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
//        clearScreen()
        drawAndRemoveNewWord()
        print(word)
    }
    
    //MARK: - Actions
    @IBAction func resetGameButtonTapped(_ sender: Any) {
        clearScreen()
        drawAndRemoveNewWord()
        print(word)
    }
    
    
    //MARK: - Helper Functions
    func clearScreen() {
        firstLetterLabel.text = ""
        secondLetterLabel.text = ""
        thirdLetterLabel.text = ""
        fourthLetterLabel.text = ""
    }
    
    func drawAndRemoveNewWord() {
        word = WordController.shared.drawNewWord()
        WordController.shared.remove(word: word)
        count = 5
    }
    


}//END OF CLASS
