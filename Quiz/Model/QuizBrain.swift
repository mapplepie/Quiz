//
//  Question.swift
//  Quiz
//
//  Created by Mai Uchida on 2021/11/11.
//

import Foundation

struct QuizBrain{
    
    var score = 0
    var questionNumber = 0
    
    let quiz = [Question(q: "5 + 5 = 10", a: "True"),
                Question(q: "5 x 5 = 100", a: "False"),
                Question(q: "10 + 10 = 100", a: "False"),
                Question(q: "11 x 11 = 141", a: "False"),
                Question(q: "12 x 12 = 144", a: "True")]
    
    
    func getScore()-> Int{
        return score
    }
    
    func getQuestion() ->  String {
        return quiz[questionNumber].question
    }
    
    func getProgress()-> Float{
        return Float(questionNumber)/Float(quiz.count)
    }
    
    mutating func nextQuestion(){
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else{
            questionNumber = 0
        }
    }
    mutating func checkAnswer(userAnsewer: String) -> Bool{
        if userAnsewer == quiz[questionNumber].answer {
            score += 1
            return true
        }else{
            return false
        }
    }
    
}
