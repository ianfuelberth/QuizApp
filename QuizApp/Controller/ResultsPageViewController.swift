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
    var totalQuestions: Int = 3
    
    var category: String = ""
    var categoryPic: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryImage.image = UIImage(systemName: categoryPic)
        
        let gradePercent = Double(totalCorrect)/3.0
        if(gradePercent > 0.66){
            resultLabel.text = "Good Job!"
        } else {
            resultLabel.text = "Study More!"
        }
        
        gradeLabel.text = "\(gradePercent * 100)% Correct"
        
        
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        print("button pressed")
    }
}
