//
//  ThirdScreen_ViewController.swift
//  Math-Battle
//
//  Created by Kaleab Gebremichael on 7/14/19.
//  Copyright © 2019 Kaleab Gebremichael. All rights reserved.
//

import UIKit

class ThirdScreen_ViewController: UIViewController {

    @IBOutlet weak var Label_HighScore1: UILabel!
    
    var firstScreen:ViewController = ViewController()
    
    var scoreString = String(0);
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Label_HighScore1.text = scoreString;
        
        
        if let score = firstScreen.dictionary.string(forKey: "highScore"){
            if var highScore = Label_HighScore1.text {
                if(Int(score)! > Int(highScore)!){
                    highScore = score;
                }
            }
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
