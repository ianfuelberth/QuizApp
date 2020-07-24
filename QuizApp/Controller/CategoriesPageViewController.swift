//
//  CategoriesPageViewController.swift
//  QuizApp
//
//  Created by Ian Fuelberth on 7/13/20.
//  Copyright © 2020 HousingInsecurity. All rights reserved.
//

import UIKit

class CategoriesPageViewController: UIViewController {

    var userCategoryChoice: String = ""
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var disneyImage: UIImageView!
    @IBOutlet weak var languageImage: UIImageView!
    @IBOutlet weak var nationalForestImage: UIImageView!
    @IBOutlet weak var geographyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func foodPressed(_ sender: UIButton) {
        userCategoryChoice = "Food"
        self.performSegue(withIdentifier: "toQuestionPage", sender: self)
    }
    
    @IBAction func disneyPressed(_ sender: UIButton) {
        userCategoryChoice = "Disney"
        self.performSegue(withIdentifier: "toQuestionPage", sender: self)
    }
    
    @IBAction func languagePressed(_ sender: UIButton) {
        userCategoryChoice = "Language"
        self.performSegue(withIdentifier: "toQuestionPage", sender: self)
    }
    
    @IBAction func nationalForestsPressed(_ sender: UIButton) {
        userCategoryChoice = "NationalForests"
        self.performSegue(withIdentifier: "toQuestionPage", sender: self)
    }
    
    @IBAction func geographyPressed(_ sender: UIButton) {
        userCategoryChoice = "Geography"
        self.performSegue(withIdentifier: "toQuestionPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let QPVC = segue.destination as! QuestionPageViewController
        QPVC.category = userCategoryChoice
        switch userCategoryChoice
        {
        case "Food":
            QPVC.categoryPic = "cart.fill"
        case "Language":
            QPVC.categoryPic = "book.fill"
        case "NationalForests":
            QPVC.categoryPic = "photo"
        case "Disney":
            QPVC.categoryPic = "airplane"
        default:
            QPVC.categoryPic = "map.fill"
        }
    }
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        print("unwound")
    }

}
