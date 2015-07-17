//
//  Player.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class Player {
    let type: PlayerType
    let id: Int
    let strategy: Strategy?
    
    init (type: PlayerType, id: Int, strategy: Strategy? = nil) {
        self.type = type
        self.id = id
        self.strategy = strategy
    }
    
    static func registerTwoPlayers() -> (Player, Player) {
        let playerOne = Player(type: PlayerType.Human, id: 0)
        let playerTwo = Player(type: PlayerType.AI, id: 1, strategy: LeftStrategy())
        
        return (playerOne, playerTwo)
    }
}

enum PlayerType {
    case Human
    case AI
}