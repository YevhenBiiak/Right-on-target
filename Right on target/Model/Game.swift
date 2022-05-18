//
//  Game.swift
//  Right on target
//
//  Created by Евгений Бияк on 05.05.2022.
//


// MARK: - Game Protocol
protocol GameProtocol {
    var totalScore: Int         { get }
    var roundsCount: Int        { get }
    var isGameEnded: Bool       { get }
    var currentRoundNumber: Int { get }
    var currentSecretValue: Int { get }
    var rounds:        [GameRoundProtocol] { get }
    
    func check(value: Int)
}

// MARK: -
class Game: GameProtocol {
    // MARK: Properties
    
    var totalScore: Int         { rounds.reduce(0) { $0 + ($1.score ?? 0) } }
    var isGameEnded: Bool       { currentRoundNumber == roundsCount && isRoundEnded}
    var isRoundEnded: Bool      { currentRound.score != nil }
    var currentSecretValue: Int { currentRound.secretValue }
    var currentRoundNumber: Int { rounds.count }
    var currentRound: GameRoundProtocol { rounds.last! }
    
    var roundsCount:    Int
    var rounds:         [GameRoundProtocol]
    
    enum RoundType {case number, color}
    lazy var roundType: RoundType = { currentRound is NumberGameRound ? .number : .color }()
    
    
    
    // MARK: - Initializers
    
    init(round: GameRoundProtocol, roundsCount: Int) {
        self.rounds         = [round]
        self.roundsCount    = roundsCount
    }
    
    
    
    
    // MARK: - Methods
    
    func check(value: Int) {

        // calculate Score
        currentRound.calculateScore(withValue: value)
        
        // add New Roud
        guard !isGameEnded else { return }
        switch roundType {
        case .number: rounds.append(NumberGameRound(withGenerator: currentRound.valueGenerator))
        case .color: rounds.append(ColorGameRound(withGenerator: currentRound.valueGenerator))
        }
    }
    func startNewGame() {
        switch roundType {
        case .number: rounds = [NumberGameRound(withGenerator: currentRound.valueGenerator)]
        case .color: rounds = [ColorGameRound(withGenerator: currentRound.valueGenerator)]
        }
    }
}
