//
//  SecondScreen_ViewController.swift
//  Math-Battle
//
//  Created by Kaleab Gebremichael on 7/13/19.
//  Copyright © 2019 Kaleab Gebremichael. All rights reserved.
//

import UIKit

class SecondScreen_ViewController: UIViewController {

    
    @IBOutlet weak var Label_Score: UILabel!
    @IBOutlet weak var Label_Equation: UILabel!
    
    @IBAction func Button_Correct(_ sender: UIButton) {
    }
    
    @IBAction func Button_Wrong(_ sender: UIButton) {
    }
    
    @IBOutlet weak var Progress_Bar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
