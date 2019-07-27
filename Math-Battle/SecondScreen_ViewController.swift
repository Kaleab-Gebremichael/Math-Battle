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
    case PLAY_BUTTON
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
    
    
    //this is where it all comes together
    func gamePlay(button:buttonClicked){
        
        //update score if correct
        makeDecision(button);
        
        let equationToDisplay:String = makeEquation(makeRandomOperation(), makeRandomOperands(), chooseRandomQuestionStatus());
        
        Label_Equation.text = equationToDisplay;
    }
    
    func updateScore( _ newScore:Int){
        Label_ScoreNum.text = String(self.score);
    }
    
    
    func makeDecision(_ button:buttonClicked){
        
        var firstScreen:ViewController = ViewController();
        
        if(button == .CORRECT_BUTTON && currentQuestionCorrect){
            self.score += 1;
            updateScore(self.score);
            
            //update highScore if needed
            //updateHighScore();
            
            firstScreen.dictionary.set(score, forKey: "highScore");
            
        } else if (button == .WRONG_BUTTON && !currentQuestionCorrect){
            self.score += 1;
            updateScore(self.score);
            
            //update highScore if needed
            //updateHighScore();
            
            firstScreen.dictionary.set(score, forKey: "highScore");
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
    
    func updateHighScore(){
        let thirdScreen = ThirdScreen_ViewController();
        
        if (String(self.score) > thirdScreen.scoreString){
            thirdScreen.scoreString = String(self.score);
        }
//
//        if thirdScreen.Label_HighScore1.text == nil{
//            thirdScreen.Label_HighScore1.text = String(score);
//            thirdScreen.dictionary.set(thirdScreen.Label_HighScore1.text, forKey: "highScore");
//        } else{
//            if self.score > (Int(thirdScreen.Label_HighScore1.text))! {
//
//                highScore = String(score);
//                thirdScreen.dictionary.set(thirdScreen.Label_HighScore1.text, forKey: "highScore");
//            }
//        }
//
//        if var highScore = thirdScreen.Label_HighScore1.text{
//            if self.score > (Int(highScore))! {
//
//                highScore = String(score);
//                thirdScreen.dictionary.set(thirdScreen.Label_HighScore1.text, forKey: "highScore");
//            }
//        }
        
        performSegue(withIdentifier: "updateHighScoreSegue", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "updateHighScoreSegue") {
//            guard let viewController = segue.destination as? ThirdScreen_ViewController else {return}
//
//            guard var highScore = viewController.Label_HighScore1 else {return}
//
//            if(self.score > Int(highScore.text!)!){
//                highScore.text = String(self.score);
//
//                viewController.dictionary.set(highScore.text, forKey: "highScore");
//            }
//        }
//    }
    
    @IBOutlet weak var Label_ScoreNum: UILabel!
    
    @IBOutlet weak var Label_Score: UILabel!
    @IBOutlet weak var Label_Equation: UILabel!
    
    @IBAction func Button_Correct(_ sender: UIButton) {
        gamePlay(button: .CORRECT_BUTTON);
    }
    
    @IBAction func Button_Wrong(_ sender: UIButton) {
        gamePlay(button: .WRONG_BUTTON);
    }
    
    @IBOutlet weak var Progress_Bar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamePlay(button: .PLAY_BUTTON)

        // Do any additional setup after loading the view.
    }


}
