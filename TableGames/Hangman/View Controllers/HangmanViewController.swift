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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var jailImageView: UIImageView!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var countdownValueLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstLetterLabel: UILabel!
    @IBOutlet weak var secondLetterLabel: UILabel!
    @IBOutlet weak var thirdLetterLabel: UILabel!
    @IBOutlet weak var fourthLetterLabel: UILabel!

    
    
    
    //MARK: - Properties
    var word = ""
    var count = 5
    var jailOpacity = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        clearLetters()
        drawAndRemoveNewWord()
        updateJailImage()
        progressBar.setProgress(0.0, animated: true)
        print(word)
    }
    
    //MARK: - Actions
    @IBAction func resetGameButtonTapped(_ sender: Any) {
        clearLetters()
        drawAndRemoveNewWord()
        updateJailImage()
        //refresh try counter and opacity of jail
        print(word)
    }

    //MARK: - Helper Functions
    
    //Check if all letters are filled (NEED A TIMES WON AREA? - Needs persistence)
    func checkWinner() {
        if (firstLetterLabel?.text != "    ") &&
            (secondLetterLabel.text != "    ") &&
            (thirdLetterLabel.text != "    ") &&
            (fourthLetterLabel.text != "    ") {
            //Change dog to crazy colors
            dogImageView.image = UIImage(named: "dog3")
            //insert wait statement
            dogImageView.image = UIImage(named: "dog2")
            //insert wait statement
            dogImageView.image = UIImage(named: "dog4")
            //Change headline that you WIN!
            titleLabel.text = "YOU WIN!!!"
            
        }
    }
    
    func loser() {
        titleLabel.text = "YOU LOSE 😭"
        //Controller popup?
        //Disable actions from running
        //Draw attention to start over button?
        
    }
    
    func clearLetters() {
        firstLetterLabel.text = "    "
        secondLetterLabel.text = "    "
        thirdLetterLabel.text = "    "
        fourthLetterLabel.text = "    "
    }
    
    func drawAndRemoveNewWord() {
        word = WordController.shared.drawNewWord()
        WordController.shared.remove(word: word)
        count = 5
    }
    
    func updateJailImage() {
        let opacity = jailOpacity
        jailImageView.image = UIImage(named: "jail")?.alpha(CGFloat(opacity))
        checkWinner()
    }
    
    func guessed(letter: Character, forWord: String) {
        var countIncorrect = 0
        for check in forWord {
            if check == letter {
                guard let range: Range<String.Index> = forWord.range(of: String(check)) else { return }
                let index: Int = forWord.distance(from: forWord.startIndex, to: range.lowerBound)
                switch index {
                case 0:
                    firstLetterLabel.text = String(check)
                    jailOpacity -= 0.25
                    updateJailImage()
                case 1:
                    secondLetterLabel.text = String(check)
                    jailOpacity -= 0.25
                    updateJailImage()
                case 2:
                    thirdLetterLabel.text = String(check)
                    jailOpacity -= 0.25
                    updateJailImage()
                case 3:
                    fourthLetterLabel.text = String(check)
                    jailOpacity -= 0.25
                    updateJailImage()
                default:
                    print("Error here 🍋")
                }
            }
            else {
                countIncorrect += 1
            }
        }//END OF FOR IN LOOP
        if countIncorrect == 4 {
            //stuff to do if letter is incorrect
            count -= 1
            countdownValueLabel.text = String(count)
            let status = (Float(count - 5) / 5).magnitude
            progressBar.setProgress(status, animated: true)
            if count == 0 {
                loser()
            }
        }
    }//END of Guessed Function
    
    
}

extension HangmanViewController {
    @IBAction func aTapped(_ sender: UIButton) {
        guessed(letter: "A", forWord: word)
    }
    @IBAction func bTapped(_ sender: UIButton) {
        guessed(letter: "B", forWord: word)
    }
    @IBAction func cTapped(_ sender: UIButton) {
        guessed(letter: "C", forWord: word)
    }
    @IBAction func dTapped(_ sender: UIButton) {
        guessed(letter: "D", forWord: word)
    }
    @IBAction func eTapped(_ sender: UIButton) {
        guessed(letter: "E", forWord: word)
    }
    @IBAction func fTapped(_ sender: UIButton) {
        guessed(letter: "F", forWord: word)
    }
    @IBAction func gTapped(_ sender: UIButton) {
        guessed(letter: "G", forWord: word)
    }
    @IBAction func hTapped(_ sender: UIButton) {
        guessed(letter: "H", forWord: word)
    }
    @IBAction func iTapped(_ sender: UIButton) {
        guessed(letter: "I", forWord: word)
    }
    @IBAction func jTapped(_ sender: UIButton) {
        guessed(letter: "J", forWord: word)
    }
    @IBAction func kTapped(_ sender: UIButton) {
        guessed(letter: "K", forWord: word)
    }
    @IBAction func lTapped(_ sender: UIButton) {
        guessed(letter: "L", forWord: word)
    }
    @IBAction func mTapped(_ sender: UIButton) {
        guessed(letter: "M", forWord: word)
    }
    @IBAction func nTapped(_ sender: UIButton) {
        guessed(letter: "N", forWord: word)
    }
    @IBAction func oTapped(_ sender: UIButton) {
        guessed(letter: "O", forWord: word)
    }
    @IBAction func pTapped(_ sender: UIButton) {
        guessed(letter: "P", forWord: word)
    }
    @IBAction func qTapped(_ sender: UIButton) {
        guessed(letter: "Q", forWord: word)
    }
    @IBAction func rTapped(_ sender: UIButton) {
        guessed(letter: "R", forWord: word)
    }
    @IBAction func sTapped(_ sender: UIButton) {
        guessed(letter: "S", forWord: word)
    }
    @IBAction func tTapped(_ sender: UIButton) {
        guessed(letter: "T", forWord: word)
    }
    @IBAction func uTapped(_ sender: UIButton) {
        guessed(letter: "U", forWord: word)
    }
    @IBAction func vTapped(_ sender: UIButton) {
        guessed(letter: "V", forWord: word)
    }
    @IBAction func wTapped(_ sender: UIButton) {
        guessed(letter: "W", forWord: word)
    }
    @IBAction func xTapped(_ sender: UIButton) {
        guessed(letter: "X", forWord: word)
    }
    @IBAction func yTapped(_ sender: UIButton) {
        guessed(letter: "Y", forWord: word)
    }
    @IBAction func zTapped(_ sender: UIButton) {
        guessed(letter: "Z", forWord: word)
    }
}//END OF CLASS

//Extension to change opacity of images
extension UIImage {
    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
