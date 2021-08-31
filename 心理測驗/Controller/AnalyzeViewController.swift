//
//  AnalyzeViewController.swift
//  心理測驗
//
//  Created by 蔡佳穎 on 2021/8/28.
//

import UIKit

class AnalyzeViewController: UIViewController {

    @IBOutlet weak var titleAndScoreLabel: UILabel!
    @IBOutlet weak var averageScoreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var personalityTrait: PersonalityTrait!
    var score: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func updateUI() {
        titleAndScoreLabel.text = "\(personalityTrait.title)：\(score!)"
        averageScoreLabel.text = "\(personalityTrait.averageScore)"
        averageScoreLabel.numberOfLines = 0
        descriptionLabel.text = "\(personalityTrait.description)"
        descriptionLabel.numberOfLines = 0
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
