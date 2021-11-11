//
//  ViewController.swift
//  Quiz
//
//  Created by Mai Uchida on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
//    var a = A()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerPressed(_ sender: UIButton) {

        let aa: String? = sender.currentTitle
        print(sender.currentTitle)
        if let userAnswer = aa{
            print(userAnswer)
             let userGotItRight = quizBrain.checkAnswer(userAnsewer: userAnswer)
            
                if userGotItRight {
                sender.backgroundColor = .green
                }else{
                sender.backgroundColor = .red
                }
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestion()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score:\(quizBrain.getScore())"
        
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
    
}

