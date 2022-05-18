//
//  Generator.swift
//  Right on target
//
//  Created by Евгений Бияк on 06.05.2022.
//

import UIKit

// MARK: - Protocol

protocol GeneratorProtocol {
    var startBound: Int { get }
    var endBound: Int { get }
    
    func getRandomValue() -> Int
}



// MARK: - NumberGenerator class

class NumberGenerator: GeneratorProtocol {
    let startBound: Int
    let endBound: Int
    
    
    init(startBound: Int, endBound: Int) {
        self.startBound = startBound
        self.endBound = endBound
    }
    
    
    func getRandomValue() -> Int {
        (startBound...endBound).randomElement()!
    }
}



// MARK: - ColorGenerator class

class ColorGenerator: GeneratorProtocol {
    let startBound: Int = 0x000000
    let endBound:   Int = 0xffffff
    
    
    func getRandomValue() -> Int {
        (startBound...endBound).randomElement()!
    }
}

