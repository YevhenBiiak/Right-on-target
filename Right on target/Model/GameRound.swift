//
//  Round.swift
//  Right on target
//
//  Created by Евгений Бияк on 06.05.2022.
//

// MARK: - Protocol

protocol GameRoundProtocol {
    var score: Int? { get }
    var secretValue: Int { get set }
    var valueGenerator: GeneratorProtocol { get }
    
    func calculateScore(withValue: Int)
}



// MARK: - NumberGameRound class

class NumberGameRound: GameRoundProtocol {
    var score: Int?
    lazy var secretValue: Int = valueGenerator.getRandomValue()
    var valueGenerator: GeneratorProtocol
    
    init(withGenerator generator: GeneratorProtocol) {
        valueGenerator = generator
    }

    func calculateScore(withValue value: Int) {
        score = valueGenerator.endBound - abs(secretValue - value)
    }
}



// MARK: - NumberGameRound class

class ColorGameRound: GameRoundProtocol {
    var score: Int?
    lazy var secretValue: Int = valueGenerator.getRandomValue()
    var valueGenerator: GeneratorProtocol
    
    
    init(withGenerator generator: GeneratorProtocol) {
        valueGenerator = generator
    }
    
    
    func calculateScore(withValue value: Int) {
        score = value == secretValue ? 1 : 0
    }
}
