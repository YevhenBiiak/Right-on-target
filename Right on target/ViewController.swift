//
//  ViewController.swift
//  Right on target
//
//  Created by Евгений Бияк on 01.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - View Properties
    
    var game: Game!
    
    @IBOutlet var label: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var progress: UIProgressView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabel(with: "Раунд \(game.currentRound). Установите число: \(game.currentSecretValue)")
        updateProgress(with: Float(game.currentRound-1) / Float(game.lastRound))
    }
    
    // MARK: - View Methods
    
    func updateLabel(with text: String) {
        label.text = text
    }
    func updateProgress(with val: Float) {
        progress.setProgress(val, animated: true)
    }
    func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    // MARK: - View Actions
    
    @IBAction func check() {
        game.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.totalScore)
            game.startNewGame()
        } else {
            game.nextRound()
        }
        updateLabel(with: "Раунд \(game.currentRound). Установите число: \(game.currentSecretValue)")
        updateProgress(with: Float(game.currentRound-1) / Float(game.lastRound))
    
    }
}

