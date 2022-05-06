//
//  Game.swift
//  Right on target
//
//  Created by Евгений Бияк on 05.05.2022.
//



protocol GameProtocol {
    // Количество заработанных очков
    var totalScore: Int { get }
    // Загаданное значение
    var currentSecretValue: Int { get }
    // Проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    // Начинает новую игру и сразу стартует первый раунд
    func startNewGame()
    // Начинает новый раунд (обновляет загаданное число)
    func nextRound()
    // Сравнивает переданное значение с загаданным и начисляет очки func calculateScore(with value: Int)
    func calculateScore(with: Int)
}



class Game: GameProtocol {
    
    // MARK: - Properties
    
    var totalScore: Int
    
    var currentSecretValue: Int
    private var minSecretValue: Int
    private var maxSecretValue: Int
    
    var currentRound: Int
    var lastRound: Int
    
    var isGameEnded: Bool {
        return currentRound >= lastRound
    }
    
    
    // MARK: - Initializers
    
    init(startValue: Int, endValue: Int, rounds: Int) {
        assert(startValue < endValue, "startSecretValue less endSecretValue")
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentRound = 1
        totalScore = 0
        currentSecretValue = (minSecretValue...maxSecretValue).randomElement()!
    }
    
    
    // MARK: - Methods
    
    func startNewGame() {
        totalScore = 0
        currentRound = 0
        nextRound()
    }
    
    func nextRound() {
        currentRound += 1
        currentSecretValue = getNewSecretValue()
    }
    
    func calculateScore(with value: Int) {
        totalScore += abs(maxSecretValue - value)
    }
    
    // MARK:  private func
    private func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
}
