//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by 19072382 on 18.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    
    var countries: [String] = []
    
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "   Score: \(score)   "
        scoreLabel.layer.borderWidth = 1
        scoreLabel.layer.borderColor = UIColor.gray.cgColor
        scoreLabel.layer.cornerRadius = 10
        scoreLabel.textColor = .gray
        
  
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
        setUpButton()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0 ... 2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    func setUpButton() {
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
    }
    
    func setInitState() {
        score = 0
        questionsAsked = 0
    }
    
    @IBAction func onButtonPress(_ sender: UIButton) {
        var alertTitle = ""
        var message = ""
        if sender.tag == correctAnswer {
            alertTitle = "Correct"
            score += 1
        } else {
            alertTitle = "Wrong, it's \(countries[sender.tag].uppercased())"
            score -= 1
        }
        questionsAsked += 1
        
        if questionsAsked == 10 {
            message = """
            🏆 Congrats! 🏆
            Your final score is \(score)
            """
            setInitState()
        } else {
            message = "Your score is \(score)"
        }
            
        scoreLabel.text = "   Score: \(score)   "
    
        let ac = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
}
