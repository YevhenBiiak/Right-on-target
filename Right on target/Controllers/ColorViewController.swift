//
//  ColorViewController.swift
//  Right on target
//
//  Created by Евгений Бияк on 16.05.2022.
//

import UIKit

  
    
    
    
// MARK: - NumberViewController
class ColorViewController: UIViewController {
    
    // MARK: View Properties
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var secretColorLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var game: Game!
    
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameInitial()
    }

    
    
    // MARK: - View Actions
    
    @IBAction func check(_ sender: UIButton) {
        game.check(value: sender.tintColor.toInt)
        updateScene()
        if game.isGameEnded { showAlertWithScore() }
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    
    // MARK: - Helps Methods
    
    func gameInitial() {
        game = Game(round: ColorGameRound(withGenerator: ColorGenerator()), roundsCount: 5)
        updateScene()
    }
    
    func updateScene() {
        updateLabel(roundLabel,       withText: game.currentRoundNumber)
        updateLabel(secretColorLabel, withText: "#"+String(format:"%02X", game.currentSecretValue))
        buttons.forEach { updateButton($0, withTintColor: UIColor(rgb: game.currentRound.valueGenerator.getRandomValue())) }
        updateButton(buttons.randomElement()!, withTintColor: UIColor(rgb: game.currentSecretValue))
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
    
    func updateLabel<T>(_ label: UILabel, withText text: T) {
        label.text = "\(text)"
    }
    func updateButton(_ button: UIButton, withTintColor tintColor: UIColor) {
        button.tintColor = tintColor
    }
}




// MARK: - Extensions

extension UIColor {
    convenience init(rgb: Int) {
        let r: CGFloat = CGFloat((rgb & 0xFF0000) >> 16) / 0xFF
        let g: CGFloat = CGFloat((rgb & 0x00FF00) >>  8) / 0xFF
        let b: CGFloat = CGFloat((rgb & 0x0000FF) >>  0) / 0xFF
        
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
    var toInt: Int {
        let rgb = self.cgColor.components!.map { $0 * 0xFF }
        let r = Int(rgb[0]) << 16
        let g = Int(rgb[1]) << 8
        let b = Int(rgb[2]) << 0
        return r | g | b
    }
}
