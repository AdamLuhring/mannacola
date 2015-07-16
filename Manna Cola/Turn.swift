//
//  Turn.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class Turn {
    let id: Int
    let playerId: Int
    var pocketSelection: Int?
    weak var game: Game?
    
    static var nextAvailableId: Int = 0
    static func getNextAvailableId() -> Int {
        let nextId = Turn.nextAvailableId
        
        Turn.nextAvailableId++
        
        return nextId
    }
    
    init (game: Game, playerId: Int) {
        self.game = game
        self.id = Turn.getNextAvailableId()
        self.playerId = playerId
    }
    
    func selectPocket(number: Int) {
        
    }
}