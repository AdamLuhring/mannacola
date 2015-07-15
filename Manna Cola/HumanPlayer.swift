//
//  HumanPlayer.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class HumanPlayer: AbleToPlay {
    var opponent: AbleToPlay? = nil
    let game: Game
    let playerNumber: Int
    
    init (game: Game) {
        self.game = game
        self.playerNumber = game.getNextAssignablePlayerNumber()
    }
    
    func hasReceivedTurn(currentState: BoardState) -> Int {
        let pocketSelection: Int = 1
        
        return pocketSelection
    }
}