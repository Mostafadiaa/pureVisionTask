//
//  examsVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 3/5/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class examsVc: UIViewController {
    @IBOutlet var answerOne: UIButton!
    @IBOutlet var answerTwo: UIButton!
    @IBOutlet var answerThree: UIButton!
    @IBOutlet var answerFour: UIButton!

    @IBOutlet var fsfs: UITextView!
    var x = 0
    var itsTheLast = false
    var engScoreCounter = 0
    var iqScoreCounter = 0
    var changeScore = false
    var CorrectAnswers = ["since", "was", "faster", "have", "does", "in", "had been", "take up", "been working", "Anxious", "20", "Bolide", "Monday", "21", "leaf", "24", "8", "128", "122", "69877698"]
    let engQuestions = [
        "A: Have you been in England a long time?\n\nB: Yes, several months. I've been here ___ August last year.",
        "A: What were you doing when I called you yesterday?\n\nB: I ___ cleaning the kitchen.",
        "A: How fast can you read English? \n\n B: I'm quite good but Julia is ___ than me.",
        "A: How long __ you been a dancer?",
        "Who ___ the housework in your home?",
        "A: Do you like photography?\n\nB: Not really, but I'm quite interested _ art.",
        "A: I ___ walking to work this way for twenty years.\n\nB: That's a long time! Do you even walk in the rain?",
        "I think I need to ___ a new sport too.",
        "A: I'm tired. I've ___ all day.\n\nB: Sit down and I'll get you a cup of tea.",
        "Choose the word most similar to Impatient",

        "Currently Mark Zuckerberg is 31 years old, 9 more years his age doubles his sister’s currently. So how old is Mark’s sister?",

        "Which one is not the same kind with the rest: Sun, Venus, Bolide, Moon, Star, Mars",

        "The day after the day after tomorrow is four days before Monday. What day is it today?",

        "Which number should come next in the series? \n 1 - 1 - 2 - 3 - 5 - 8 - 13",
        "Forest is to tree as tree is to ?",

        "Mary, who is sixteen years old, is four times as old as her brother. How old will Mary be when she is twice as old as her brother?",

        "Which one of the numbers does not belong in the following series? \n 2 - 3 - 6 - 7 - 8 - 14 - 15 - 30",

        "2-4-8-16-32-64 \nWhat’s the next number",
        "Tom has a new set of golf clubs. Using a club 8, the ball travels an average distance of 100 meters. Using a club 7, the ball travels an average distance of 108 meters. Using a club 6, the ball travels an average distance of 114 meters. How far will the ball go if Tom uses a club 5 ?",
        "If EGGFHGHE is 97786769 then HEFGGHFE is",
    ]

    let mAnswers = [["in", "since", "for", "during"],
                    ["been", "did", "am", "was"],
                    ["fastest", "more fast", "faster", "fast"],
                    ["were", "have", "had", "did"],
                    ["makes", "does", "gets", "works"],
                    ["on", "of", "to", "in"],
                    ["am", "have been", "was", "had been"],
                    ["take up", "take after", "take out", "take to"],
                    ["being working", "be working", "been working", "working"],
                    ["Cool", "Anxious", "Strict", "kind"],
                    ["20", "21", "22", "24"],
                    ["Sun", "Venus", "Bolide", "Moon"],
                    ["Monday", "Tuesday", "Wednesday", "Thursday"],
                    ["8", "13", "21", "31"],
                    ["plant", "leaf", "branch", "mangrove"],
                    ["20", "24", "28", "22"],
                    ["6", "7", "8", "15"],
                    ["128", "90", "100", "256"],
                    ["122 meters", "120 meters", "118 meters", "116 meters"],
                    ["69876988", "69877698", "69877689", "69877698"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        fsfs.text = engQuestions[0]
        let firstArr = mAnswers[0]
        answerOne.setTitle(firstArr[0], for: .normal)
        answerTwo.setTitle(firstArr[1], for: .normal)
        answerThree.setTitle(firstArr[2], for: .normal)
        answerFour.setTitle(firstArr[3], for: .normal)
        if answerOne.titleLabel?.text == CorrectAnswers[0] {
            print("hghg")
        }
        title = "Exams"
        // print(mAnswers[0])
    }

    func updateQuastiontext() {
        x += 1
        fsfs.text = engQuestions[x]
        let arr = mAnswers[x]
        answerOne.setTitle(arr[0], for: .normal)
        answerTwo.setTitle(arr[1], for: .normal)
        answerThree.setTitle(arr[2], for: .normal)
        answerFour.setTitle(arr[3], for: .normal)
        checkOnTheLast()
    }

    @IBAction func xAction(_ sender: Any) {
        if x < engQuestions.count - 1 {
            updateQuastiontext()
        } else {
            return
        }
        if x == 10 {
            UIView.animate(withDuration: 0.0) {
                self.fsfs.alpha = 0
                self.answerOne.alpha = 0
                self.answerTwo.alpha = 0
                self.answerThree.alpha = 0
                self.answerFour.alpha = 0
                self.changeScore = true
            }
            let alert = UIAlertController(title: "Your English Score", message: "English Score : \(engScoreCounter) \n Next is The IQ Test Cick Ok To continue", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                _ in
                UIView.animate(withDuration: 0.5) {
                    self.fsfs.alpha = 1
                    self.answerOne.alpha = 1
                    self.answerTwo.alpha = 1
                    self.answerThree.alpha = 1
                    self.answerFour.alpha = 1
                }
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }

    func checkOnTheLast() {
        if x == engQuestions.count - 1 {
            itsTheLast = true
            print("its The Last  -> \(itsTheLast)")
        }
    }

    func doneAcc() {
        let alert = UIAlertController(title: "Your IQ Score", message: "IQ Score : \(iqScoreCounter) \n Your Total Score : \(iqScoreCounter + engScoreCounter) \n Thank You", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            _ in
            let thanks = self.storyboard?.instantiateViewController(withIdentifier: "thanksVc") as! thanksVc
            self.present(thanks, animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func selectedAction(_ sender: UIButton) {
        if CorrectAnswers.contains((sender.titleLabel?.text)!) {
            print("ans1")
            if !changeScore {
                engScoreCounter += 1
            } else {
                iqScoreCounter += 1
            }
        }
        if itsTheLast {
            doneAcc()
        }
    }

    @IBAction func twoSelected(_ sender: UIButton) {
        if CorrectAnswers.contains((sender.titleLabel?.text)!) {
            print("ans2")
            if !changeScore {
                engScoreCounter += 1
            } else {
                iqScoreCounter += 1
            }
        }
        if itsTheLast {
            doneAcc()
        }
    }

    @IBAction func threeSelected(_ sender: UIButton) {
        if CorrectAnswers.contains((sender.titleLabel?.text)!) {
            print("ans3")
            if !changeScore {
                engScoreCounter += 1
            } else {
                iqScoreCounter += 1
            }
        }
        if itsTheLast {
            doneAcc()
        }
    }

    @IBAction func fourSelected(_ sender: UIButton) {
        if CorrectAnswers.contains((sender.titleLabel?.text)!) {
            print("ans4")
            if !changeScore {
                engScoreCounter += 1
            } else {
                iqScoreCounter += 1
            }
        }
        if itsTheLast {
            doneAcc()
        }
    }
}
