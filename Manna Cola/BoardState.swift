//
//  BoardState.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class BoardState {
    let playerPerspective: AbleToPlay
    let mySide: Side
    let myGoal: Goal
    var opponentSide: Side? = nil
    var opponentGoal: Goal? = nil
    
    init (fromPlayerPerspective: AbleToPlay, sides: [Side], goals: [Goal]) throws {
        self.playerPerspective = fromPlayerPerspective
        
        let playerNumber = self.playerPerspective.playerNumber
        
        self.mySide = sides[playerNumber]
        self.myGoal = goals[playerNumber]
        
        guard let opponent = self.playerPerspective.opponent else {
            throw BoardStateError.CannotInitializeWithoutOpponent
        }
        
        let opponentNumber = opponent.playerNumber
        
        self.opponentSide = sides[opponentNumber]
        self.opponentGoal = goals[opponentNumber]
    }
}

enum BoardStateError: ErrorType {
    case CannotInitializeWithoutOpponent
}