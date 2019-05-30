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
    
    
    
    //MARK: - Properties
    var word = ""
    var count = 5
    var jailOpacity = 1.0

    override func viewDidLoad() {
        super.viewDidLoad()
        clearLetters()
        drawAndRemoveNewWord()
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
    @IBAction func aTapped(_ sender: UIButton) {
        //see if letter is in the word (guessed helper func)
        guessed(letter: "A", forWord: word)
        
    }
    @IBAction func bTapped(_ sender: UIButton) {
    }
    @IBAction func cTapped(_ sender: UIButton) {
    }
    @IBAction func dTapped(_ sender: UIButton) {
    }
    @IBAction func eTapped(_ sender: UIButton) {
    }
    //Finish adding actions here


    //MARK: - Helper Functions
    func clearLetters() {
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
    
    func updateJailImage() {
        let opacity = jailOpacity
        jailImageView.image = UIImage(named: "jail")?.alpha(CGFloat(opacity))
        
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
            let status = Float((count - 5) / 5).magnitude
            progressBar.setProgress(status, animated: true)
            countdownValueLabel.text = String(count)
        }
    }//END of Guessed Function
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
