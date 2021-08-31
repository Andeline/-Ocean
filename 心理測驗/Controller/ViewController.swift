//
//  ViewController.swift
//  心理測驗
//
//  Created by 蔡佳穎 on 2021/8/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func oneChosen(_ sender: UIButton) {
        getScore(userBtn: .one)
        updateUI()
    }
    
    @IBAction func twoChosen(_ sender: UIButton) {
        getScore(userBtn: .two)
        updateUI()
    }
    
    @IBAction func threeChosen(_ sender: UIButton) {
        getScore(userBtn: .three)
        updateUI()
    }
    
    @IBAction func fourChosen(_ sender: UIButton) {
        getScore(userBtn: .four)
        updateUI()
    }
    
    @IBAction func fiveChosen(_ sender: UIButton) {
        getScore(userBtn: .five)
        updateUI()
    }
    
    @IBSegueAction func showScoreTableViewController(_ coder: NSCoder) -> ScoreTableViewController? {
        let controller = ScoreTableViewController(coder: coder)
        
        //傳資料
        controller?.oceanScore = OceanScore(oScore: addUpScore().0, cScore: addUpScore().1, eScore: addUpScore().2, aScore: addUpScore().3, nScore: addUpScore().4)
        
        //資料重置
        index = 0
        for i in 0...14 {
            questions[i].score = 0
        }
        return controller
    }
    
    func getScore(userBtn: Btn) {
        //將Btn上分數儲存至questions陣列裡的score
        if index < questions.count {
            questions[index].score = userBtn.btnScore
            print(questions[index].score)
            index += 1
        } //沒有下一題，到下一頁
        else if index == questions.count {
            performSegue(withIdentifier: "showScore", sender: nil)
        }
    }
    
    func addUpScore() -> (Int, Int, Int, Int, Int) {
        let oScore = questions[4].score + questions[14].score - questions[9].score
        let cScore = questions[12].score - questions[2].score - questions[7].score
        let eScore = questions[5].score + questions[10].score - questions[0].score
        let aScore = questions[1].score + questions[11].score - questions[6].score
        let nScore = questions[3].score + questions[8].score - questions[12].score
        return (oScore, cScore, eScore, aScore, nScore)
    }
    
    func updateUI() {
        print("index:\(index)")
        if index < questions.count {
            questionLabel.text = "\(questions[index].question)"
            questionLabel.numberOfLines = 0
        }
    }
}

