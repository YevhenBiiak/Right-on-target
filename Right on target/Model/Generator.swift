//
//  Generator.swift
//  Right on target
//
//  Created by Евгений Бияк on 06.05.2022.
//

// MARK: - Protocol

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}


// MARK: - Inherited classes

class NumberGenerator: GeneratorProtocol {
    private var start: Int
    private var end: Int
    
    
    init(startBound: Int, endBound: Int) {
        start = startBound
        end = endBound
    }
    
    
    func getRandomValue() -> Int {
        (start...end).randomElement()!
    }
}
