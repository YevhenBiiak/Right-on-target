//
//  Game.swift
//  Right on target
//
//  Created by Евгений Бияк on 05.05.2022.
//


// MARK: - Game Protocol
protocol GameProtocol {
    var totalScore: Int { get }
    var currentRound: Int { get }
    var roundsCount: Int { get }
    var isGameEnded: Bool { get }
    var currentSecretValue: Int { get }
    var round: GameRoundProtocol! { get }
    
    init(valueGenerator: GeneratorProtocol, rounds: Int)
    
    func startNewRound()
    func startNewGame()
}


// MARK: Game class
class Game: GameProtocol {
    
    // MARK: - Properties
    
    var currentRound: Int { rounds.count }
    var currentSecretValue: Int { round.secretValue }
    var isGameEnded: Bool { currentRound >= roundsCount }
    var totalScore: Int { rounds.reduce(0) { $0 + $1.score } }
    var roundsCount: Int
    
    var round: GameRoundProtocol!
    
    private var secretValueGeneratior: GeneratorProtocol
    private var rounds: [GameRoundProtocol] = []
    
    
    
    // MARK: - Initializers
    
    required init(valueGenerator: GeneratorProtocol, rounds: Int) {
        roundsCount = rounds
        secretValueGeneratior = valueGenerator
        startNewRound()
    }
    
    
    
    // MARK: - Methods
    
    func startNewRound() {
        round = GameRound(whitSecretValue: secretValueGeneratior.getRandomValue())
        rounds.append(round)
    }
    func startNewGame() {
        rounds = []
        startNewRound()
    }
}
    
    
