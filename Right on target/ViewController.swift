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
    
    private var number:Int = 0
    private var round:Int = 1
    private var points:Int = 0
    

    
    

    override func loadView() {
        super.loadView()
        
        //let versionlabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 20))
        //versionlabel.text = "Версия 1.1"
        //view.addSubview(versionlabel)
        
        print("Load View")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDdidLoad")
        
        number = Int.random(in: 1...50)
        label.text = String(number)
        
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
            
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else if numSlider == number {
                points += 50
            }
            
            if round == 5 {
                let alert = UIAlertController (
                    title: "Игра окончена", message: "Вы заработали \( points) очков", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Начать заново", style:  .default, handler: nil))
                present(alert,animated: true,completion: nil)
                round = 1
                points = 0
            } else {
            
                round+=1
            }
            
        
        number = Int.random(in: 1...50)
        label.text = String(number)
        
        
    }
    
    
    
}

