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
        //for loop to check/repeat this?
        if forWord.contains(letter) {
            //stuff to do if guess letter correctly
            //update label for correct letter guessed
            
            jailOpacity -= 0.25
            updateJailImage()
            
            guard let range: Range<String.Index> = forWord.range(of: String(letter)) else { return }
            let index: Int = forWord.distance(from: forWord.startIndex, to: range.lowerBound)
            
            switch index {
            case 0:
                print("insert here")
            case 1:
                print("insert here")
            case 2:
                print("insert here")
            case 3:
                print("insert here")
            default:
                print("Error here 🍋")
            }
            
            
            
        } else {
            //stuff to do if letter is incorrect
            count -= 1
            let status = Float((count - 5) / 5).magnitude
            progressBar.setProgress(status, animated: true)
            countdownValueLabel.text = String(count)
        }
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
