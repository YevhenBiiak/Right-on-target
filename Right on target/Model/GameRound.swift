//
//  Round.swift
//  Right on target
//
//  Created by Евгений Бияк on 06.05.2022.
//

// MARK: - Protocol

protocol GameRoundProtocol {
    var score: Int { get }
    var secretValue: Int { get }
    
    func calculateScore(with: Int)
}


// MARK: - Inherited classes

class GameRound: GameRoundProtocol {
    var score: Int
    var secretValue: Int
    
    
    init(whitSecretValue value: Int) {
        score = 0
        secretValue = value
    }
    
    
    func calculateScore(with value: Int) {
        score = 50 - abs(secretValue - value)
    }
}
