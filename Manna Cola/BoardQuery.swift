//
//  BoardQuery.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class BoardQuery {
    let asPlayer: AbleToPlay
    var opponent: AbleToPlay {
        get {
            return self.asPlayer.opponent!
        }
    }
    let mySide: Side
    var opponentSide: Side? = nil
    let game: Game
    
    init (asPlayer: AbleToPlay, inGame: Game) throws {
        self.asPlayer = asPlayer
        self.game = inGame
        self.mySide = game.sides[asPlayer.playerNumber]
        self.opponentSide = game.sides[self.opponent.playerNumber]
    }
    
    func getMyScore() -> Int {
        return self.game.getGoalForPlayer(self.asPlayer).count
    }
    
    func getOpponentScore() -> Int {
        return self.game.getGoalForPlayer(self.opponent).count
    }
}

enum BoardQueryError: ErrorType {
    case CannotQueryOnBehalfOfPlayerWithoutAnOpponent
}