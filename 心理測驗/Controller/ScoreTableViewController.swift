//
//  ScoreTableViewController.swift
//  心理測驗
//
//  Created by 蔡佳穎 on 2021/8/28.
//

import UIKit

class ScoreTableViewController: UITableViewController {
    
    @IBOutlet weak var oScoreLabel: UILabel!
    @IBOutlet weak var cScoreLabel: UILabel!
    @IBOutlet weak var eScoreLabel: UILabel!
    @IBOutlet weak var aScoreLabel: UILabel!
    @IBOutlet weak var nScoreLabel: UILabel!
    
    @IBOutlet var averageScoreLabels: [UILabel]!
    
    var oceanScore: OceanScore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    @IBSegueAction func showAnalyzeViewController(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> AnalyzeViewController? {
        let controller = AnalyzeViewController(coder: coder)
        
        //傳資料
        switch segueIdentifier {
        case "showO":
            controller?.personalityTrait = personalityTraits[0]
            controller?.score = oceanScore.oScore
        case "showC":
            controller?.personalityTrait = personalityTraits[1]
            controller?.score = oceanScore.cScore
        case "showE":
            controller?.personalityTrait = personalityTraits[2]
            controller?.score = oceanScore.eScore
        case "showA":
            controller?.personalityTrait = personalityTraits[3]
            controller?.score = oceanScore.aScore
        case "showN":
            controller?.personalityTrait = personalityTraits[4]
            controller?.score = oceanScore.nScore
        default:
            break
        }
        return controller 
    }
    // MARK: - Table view data source
    func updateUI() {
        oScoreLabel.text = "\(oceanScore.oScore)"
        cScoreLabel.text = "\(oceanScore.cScore)"
        eScoreLabel.text = "\(oceanScore.eScore)"
        aScoreLabel.text = "\(oceanScore.aScore)"
        nScoreLabel.text = "\(oceanScore.nScore)"
        
        for i in 0...4 {
            averageScoreLabels[i].text = "\(personalityTraits[i].averageScore)"
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
