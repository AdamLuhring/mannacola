//
//  Game.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class Game {
    var board: Board
    var players = [Player]()
    var turns = [Turn]()
    
    init () {
        self.board = Board(numberOfSides: 2)
        
        // Add two players
        self.players.append(Player(type: PlayerType.Human, id: 0))
        self.players.append(Player(type: PlayerType.Human, id: 1))
    }
}
