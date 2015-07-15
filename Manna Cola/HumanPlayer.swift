//
//  HumanPlayer.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


class HumanPlayer: AbleToPlay {
    var opponent: AbleToPlay?
    let game: Game
    let playerNumber: Int
    
    init (game: Game) {
        self.opponent = nil
        self.game = game
        self.playerNumber = game.getNextAssignablePlayerNumber()
    }
    
    func hasReceivedTurn() {
        
        return
    }
    
    func emptiesPocket(pocketNumber: Int) {
        do {
            try self.game.emptyPocketForPlayer(self, pocketNumber: pocketNumber)
        } catch {
            // HANDLE THIS CASE!
        }
        
        return
    }
}