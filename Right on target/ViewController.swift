//
//  ViewController.swift
//  Right on target
//
//  Created by Дмитрий Грибанский on 26.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider:UISlider!
    @IBOutlet var label: UILabel!
    
    private var game:Game!
    
    

    override func loadView() {
        super.loadView()
        print("Load View")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDdidLoad")
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String (game.currentSecretValue))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    
    @IBAction func checkNumber(){
        
        let numSlider = Int(slider.value.rounded())
        game.calculateScore(with: numSlider)
        
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    private func updateLabelWithSecretNumber(newText:String){
        label.text = newText
    }
    
    private func showAlertWith(score:Int){
        let alert = UIAlertController (
            title: "Игра окончена", message: "Вы заработали \( score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style:  .default, handler: nil))
        present(alert,animated: true,completion: nil)
        
    }
}

