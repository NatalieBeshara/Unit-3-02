
// Created on: 11-Oct-2018
// Created by: Natalie Beshara
// Created for: ICS3U
// This program is a Guess the Number game

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import UIKit

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    // properties
    let instructionsLabel = UILabel()
    let numberTextField = UITextField()
    let submitButton = UIButton()
    let answerLabel = UILabel()
    let cheatingLabel = UILabel()
    let NUMBER_TO_GUESS : Int = Int(arc4random_uniform(10)+1)
    // when Swift gets updated to Swift 4.2 use ( let NUMBER_TO_GUESS = Int.random(in: 1 ..< 10 +1) ) to create a random number
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.view = view
        
        instructionsLabel.text = "Guess the Number between 1 and 10!"
        instructionsLabel.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        view.addSubview(instructionsLabel)
        instructionsLabel.translatesAutoresizingMaskIntoConstraints = false
        instructionsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        instructionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        numberTextField.borderStyle = UITextBorderStyle.roundedRect
        numberTextField.placeholder = "   "
        view.addSubview(numberTextField)
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        numberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        numberTextField.bottomAnchor.constraint(equalTo: instructionsLabel.topAnchor, constant: 80).isActive = true
        
        submitButton.setTitle("Check", for: UIControlState.normal)
        submitButton.setTitleColor(.blue, for: .normal)
        submitButton.addTarget(self, action: #selector(guessTheNumber), for: .touchUpInside)
        view.addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        submitButton.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: 20).isActive = true
        
        answerLabel.text = nil
        answerLabel.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        answerLabel.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20).isActive = true
        
        cheatingLabel.text = String("Answer: \(NUMBER_TO_GUESS)")
        cheatingLabel.textColor = #colorLiteral(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        view.addSubview(cheatingLabel)
        cheatingLabel.translatesAutoresizingMaskIntoConstraints = false
        cheatingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70).isActive = true
        cheatingLabel.bottomAnchor.constraint(equalTo: numberTextField.topAnchor, constant: 27).isActive = true
    }
    @objc func guessTheNumber() {
        //  
        
        var numberGuessed: Int = Int(numberTextField.text!)!
            
            if numberGuessed > 10 {
                answerLabel.text = "Please pick a number between 1 and 10."
            }
            
        else if numberGuessed == NUMBER_TO_GUESS { 
                answerLabel.text = "Correct! :)"
            }
            
            else {
                answerLabel.text = "Incorrect. The correct number was:  \(NUMBER_TO_GUESS) .  Please try again."
            }
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()
