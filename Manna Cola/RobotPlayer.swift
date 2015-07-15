//
//  RobotPlayer.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class RobotPlayer: AnyPlayer {
    var opponent: AnyPlayer? = nil
    let game: Game
    let playerNumber: Int
    
    init (game: Game) {
        self.game = game
        self.playerNumber = game.getNextAssignablePlayerNumber()
    }
    
    func hasReceivedTurn(state: BoardState) -> Int {
        let myPockets = state.mySide.pockets
        
        // Always choose left most pocket available
        for pocketNumber in 1...6 {
            if myPockets[pocketNumber].count > 0 {
                return pocketNumber
            }
        }
        
        return 0
    }
}