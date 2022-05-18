//
//  NumberViewController.swift
//  Right on target
//
//  Created by Евгений Бияк on 01.05.2022.
//

import UIKit

// MARK: - NumberViewController
class NumberViewController: UIViewController {
    // MARK: View Properties
    
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var secretValueLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var progress: UIProgressView!
    var game: Game!
    
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameInitial()
    }
    
    
    
    // MARK: - View Actions
    
    @IBAction func check() {
        game.check(value: Int(slider.value))
        updateScene()
        if game.isGameEnded { showAlertWithScore() }
    }
    @IBAction func back() {
        dismiss(animated: true)
    }
    
    
    
    // MARK: - Help Methods
    
    func gameInitial() {
        let generator = NumberGenerator(startBound: 0, endBound: 50)
        game = Game(round: NumberGameRound(withGenerator: generator), roundsCount: 5)
        updateScene()
    }
    
    func updateScene() {
        updateLabel(roundLabel,       with: game.currentRoundNumber)
        updateLabel(secretValueLabel, with: game.currentSecretValue)
        updateProgress(with: Float(game.currentRoundNumber) / Float(game.roundsCount))
    }
    
    func showAlertWithScore() {
        let alert = UIAlertController(
            title:          "Игра окончена",
            message:        "Вы заработали \(game.totalScore) очков",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Заново!", style: .default) {_ in self.gameInitial() } )
        alert.addAction(UIAlertAction(title: "Отменить", style: .default))
        self.present(alert, animated: true)
    }
    
    
    
    // MARK: - View Methods
    
    func updateLabel<T>(_ label: UILabel, with value: T) {
        label.text = "\(value)"
    }
    
    func updateProgress(with value: Float) {
        progress.setProgress(value, animated: true)
    }
}

