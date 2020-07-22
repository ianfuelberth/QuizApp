//
//  QuestionPageViewController.swift
//  QuizApp
//
//  Created by Ian Fuelberth on 7/13/20.
//  Copyright © 2020 HousingInsecurity. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class QuestionPageViewController: UIViewController {

    var category: String = ""
    var categoryPic: String = ""
    var totalCorrect: Int = 0
    var questionNum: Int = 0
    var userChoice: String = ""
    var choiceBox: UIView?
    
    var test: [Question] = []
    
    let db = Firestore.firestore()
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    //A
    @IBOutlet weak var boxA: UIView!
    @IBOutlet weak var choiceA: UILabel!
    
    //B
    @IBOutlet weak var boxB: UIView!
    @IBOutlet weak var choiceB: UILabel!
    
    //C
    @IBOutlet weak var boxC: UIView!
    @IBOutlet weak var choiceC: UILabel!
    
    //D
    @IBOutlet weak var boxD: UIView!
    @IBOutlet weak var choiceD: UILabel!
    
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        test = []
        totalCorrect = 0
        questionNum = 0
        // Do any additional setup after loading the view.
        
        db.collection(category).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents, \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) ==> \(document.data())")
                    let q = document["q"] as! String
                    let ans = document["ans"] as! String
                    let a = document["a"] as! String
                    let b = document["b"] as! String
                    let c = document["c"] as! String
                    let d = document["d"] as! String
                    self.test.append(Question(question: q, answer: ans, a: a, b: b, c: c, d: d))
                }
                self.loadQuestion(questionNum: self.questionNum)
            }
        }
    }
    
    func loadQuestion(questionNum: Int)
    {
        choiceA.text = test[questionNum].a
        choiceB.text = test[questionNum].b
        choiceC.text = test[questionNum].c
        choiceD.text = test[questionNum].d
        questionLabel.text = test[questionNum].question
    }
    
    func checkAnswer()
    {
        boxA.isUserInteractionEnabled = false
        boxB.isUserInteractionEnabled = false
        boxC.isUserInteractionEnabled = false
        boxD.isUserInteractionEnabled = false
        
        let answer = self.test[questionNum].answer
        print(answer)
        if userChoice == answer {
            choiceBox?.backgroundColor = UIColor.green
            totalCorrect += 1
        } else {
            choiceBox?.backgroundColor = UIColor.red
            switch answer{
            case "a":
                boxA.backgroundColor = UIColor.green
            case "b":
                boxB.backgroundColor = UIColor.green
            case "c":
                boxC.backgroundColor = UIColor.green
            default:
                boxD.backgroundColor = UIColor.green
            }
        }
        submitButton.isUserInteractionEnabled = true
    }
    
    
    @IBAction func okPressed(_ sender: UIButton) {
        questionNum += 1
        submitButton.isUserInteractionEnabled = false
        boxA.backgroundColor = UIColor.orange
        boxB.backgroundColor = UIColor.orange
        boxC.backgroundColor = UIColor.orange
        boxD.backgroundColor = UIColor.orange
        
        if questionNum == 3
        {
            self.performSegue(withIdentifier: "toResultsPage", sender: self)
        } else {
            loadQuestion(questionNum: questionNum)
        }
        
        boxA.isUserInteractionEnabled = true
        boxB.isUserInteractionEnabled = true
        boxC.isUserInteractionEnabled = true
        boxD.isUserInteractionEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let RPVC = segue.destination as! ResultsPageViewController
        RPVC.category = category
        RPVC.totalCorrect = totalCorrect
        RPVC.categoryImage = categoryImage
    }
    
    //MARK: - Gesture Recognizers
    
    @IBAction func tappedA(_ sender: UIGestureRecognizer) {
        userChoice = "a"
        choiceBox = boxA
        checkAnswer()
    }
    
    @IBAction func tappedB(_ sender: UIGestureRecognizer) {
        userChoice = "b"
        choiceBox = boxB
        checkAnswer()
    }
    
    @IBAction func tappedC(_ sender: UIGestureRecognizer) {
        userChoice = "c"
        choiceBox = boxC
        checkAnswer()
    }
    
    @IBAction func tappedD(_ sender: UIGestureRecognizer) {
        userChoice = "d"
        choiceBox = boxD
        print(userChoice)
        checkAnswer()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let aGestureRecog = UIGestureRecognizer(target: self, action: #selector(tappedA))
        boxA.addGestureRecognizer(aGestureRecog)
        boxA.isUserInteractionEnabled = true
        
        let bGestureRecog = UIGestureRecognizer(target: self, action: #selector(tappedB))
        boxB.addGestureRecognizer(bGestureRecog)
        boxB.isUserInteractionEnabled = true
        
        let cGestureRecog = UIGestureRecognizer(target: self, action: #selector(tappedC))
        boxC.addGestureRecognizer(cGestureRecog)
        boxC.isUserInteractionEnabled = true
        
        let dGestureRecog = UIGestureRecognizer(target: self, action: #selector(tappedD))
        boxD.addGestureRecognizer(dGestureRecog)
        boxD.isUserInteractionEnabled = true
        
        
        
        
    }

}
