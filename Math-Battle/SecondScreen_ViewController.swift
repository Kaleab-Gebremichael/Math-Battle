//
//  SecondScreen_ViewController.swift
//  Math-Battle
//
//  Created by Kaleab Gebremichael on 7/13/19.
//  Copyright © 2019 Kaleab Gebremichael. All rights reserved.
//

import UIKit

enum buttonClicked {
    case CORRECT_BUTTON
    case WRONG_BUTTON
}

enum questionStatus{
    case MAKECORRECTQUESTION
    case MAKEWRONGQUESTION
}

enum Operations{
    case ADDITION
    case SUBTRACTION
    case MULTIPLICATION
    case DIVISION
}

struct Operands{
    let firstNum:Int
    let secondNum:Int
}


class SecondScreen_ViewController: UIViewController {
    
    //instance variables
    
    var score:Int = 0;
    var currentQuestionCorrect:Bool = true;
    
    func updateScore( _ newScore:Int){
        score = newScore;
        Label_ScoreNum.text = String(score);
    }
    
    func makeDecision(button:buttonClicked){
        if(button == .CORRECT_BUTTON && currentQuestionCorrect){
            score += 1;
            updateScore(score);
        }
        //don't see the need for additional statements here
    }
    
    
    
    func makeRandomOperands() -> Operands {
        let both = Operands(firstNum: Int.random(in: 2 ..< 100), secondNum: Int.random(in: 3 ..< 100));
        
        return both;
    }
    
    func makeRandomOperation() -> Operations {
        let randomNum:Int = Int.random(in: 0...3);
        
        if(randomNum == 0){
            return .ADDITION;
        } else if (randomNum == 1){
            return .SUBTRACTION;
        } else if (randomNum == 2){
            return .MULTIPLICATION;
        } else {
            return .DIVISION;
        }
    }
    
    func chooseRandomQuestionStatus() -> questionStatus {
        let randomNum:Int = Int.random(in: 0...1)
        
        if(randomNum == 0){
            return .MAKECORRECTQUESTION
        } else{
            return .MAKEWRONGQUESTION
        }
    }
    
    func makeEquation(_ operations:Operations, _ operands:Operands, _ questionStatus:questionStatus) -> String {
        var outputStr:String
        
        if (operations == .ADDITION) {
            let result:Int = operands.firstNum + operands.secondNum
            
            if (questionStatus == .MAKECORRECTQUESTION){
                outputStr = String(operands.firstNum) + " + " + String(operands.secondNum) + " = " + String(result);
                
                currentQuestionCorrect = true;
            } else {
                outputStr = String(operands.firstNum) + " + " + String(operands.secondNum) + " = " + String(result+10);
                
                currentQuestionCorrect = false;
            }
            
        } else if (operations == .SUBTRACTION) {
            let result:Int = operands.firstNum - operands.secondNum
            
            if (questionStatus == .MAKECORRECTQUESTION){
                outputStr = String(operands.firstNum) + " - " + String(operands.secondNum) + " = " + String(result);
                
                currentQuestionCorrect = true;
            } else {
                outputStr = String(operands.firstNum) + " - " + String(operands.secondNum) + " = " + String(result-10);
                
                currentQuestionCorrect = false;
            }
        } else if (operations == .MULTIPLICATION) {
            let result:Int = operands.firstNum * operands.secondNum
            
            if (questionStatus == .MAKECORRECTQUESTION){
                outputStr = String(operands.firstNum) + " * " + String(operands.secondNum) + " = " + String(result);
                
                currentQuestionCorrect = true;
            } else {
                outputStr = String(operands.firstNum) + " * " + String(operands.secondNum) + " = " + String(result + 10);
                
                currentQuestionCorrect = false;
            }
        } else {
            let result:Int = operands.firstNum / operands.secondNum
            
            if (questionStatus == .MAKECORRECTQUESTION){
                outputStr = String(operands.firstNum) + " / " + String(operands.secondNum) + " = " + String(result);
                
                currentQuestionCorrect = true;
            } else {
                outputStr = String(operands.firstNum) + " / " + String(operands.secondNum) + " = " + String(result-10);
                
                currentQuestionCorrect = false;
            }
        }
        
        
        return outputStr
    }
    
    
    @IBOutlet weak var Label_ScoreNum: UILabel!
    
    @IBOutlet weak var Label_Score: UILabel!
    @IBOutlet weak var Label_Equation: UILabel!
    
    @IBAction func Button_Correct(_ sender: UIButton) {
        makeDecision(button: .CORRECT_BUTTON);
    }
    
    @IBAction func Button_Wrong(_ sender: UIButton) {
        makeDecision(button: .WRONG_BUTTON);
    }
    
    @IBOutlet weak var Progress_Bar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
