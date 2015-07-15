//
//  HumanPlayer.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


class HumanPlayer: AbleToPlay {
    var pocketSet: [Pocket]
    var goal: Goal?
    var opponent: AbleToPlay?
    let game: Game
    let playerNumber: Int
    
    init (game: Game) {
        self.opponent = nil
        self.pocketSet = Pocket.initializePocketSet(6)
        self.game = game
        self.playerNumber = game.getNextAssignablePlayerNumber()
        self.goal = Goal(owner: self)
    }
    
    func hasReceivedTurn() {
        
        return
    }
    
    func emptiesPocket(pocketNumber: Int) {
        var pile: MovingPile
        let countOfSelectedPocket = self.pocketSet[pocketNumber].count
        var currentReceptacle: AbleToReceiveStones = self.pocketSet[pocketNumber]
        
        if countOfSelectedPocket > 0 {
            pile = self.pocketSet[pocketNumber].empty()
        } else {
            // Nothing to empty! This was an invalid choice!
            return
        }
        
        // Move currentReceptacle to next position
        
        while pile.count > 0 {
            
            // Make deposit to currentReceptacle
            pile.depositTo(&currentReceptacle)
            
            // Move currentReceptacle to next position
            
        }
        
        return
    }
}