//
//  ViewController.swift
//  Right on target
//
//  Created by Евгений Бияк on 01.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var progress: UIProgressView!
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    
    var number: Int = 0
    var round: Int = 0
    var points: Int = 0
    
    @IBAction func check(_ sender: UIButton) {
        switch sender.titleLabel!.text {
        case "Проверить":
            label.text = "Вы ошиблись на \(Int(slider.value) - number)"
            points += 50 - abs(number - Int(slider.value))
            if round < 5 {
                sender.setTitle("Следующее число", for: .normal)
            } else {
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(self.points) очков",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default))
                self.present(alert, animated: true)
                round = 0
                progress.setProgress(Float(round)/5, animated: true)
                sender.setTitle("Начать снова", for: .normal)
            }
        default:
            round += 1
            progress.setProgress(Float(round)/5, animated: true)
            number = Int.random(in: 0...50)
            label.text = "Раунд \(round). Установите число - \(number)"
            sender.setTitle("Проверить", for: .normal)
        }
    }
}

