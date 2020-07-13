//
//  ResultsPageViewController.swift
//  QuizApp
//
//  Created by Ian Fuelberth on 7/13/20.
//  Copyright © 2020 HousingInsecurity. All rights reserved.
//

import UIKit

class ResultsPageViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    var totalCorrect: Int = 0
    var totalQuestions: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradePercent = Double(totalCorrect)/Double(totalQuestions)
        if(gradePercent > 0.75){
            resultLabel.text = "You Passed!"
        } else {
            resultLabel.text = "Study More!"
        }
        
        gradeLabel.text = "\(gradePercent * 100)% Correct"
        
        
    }
    
    

}
