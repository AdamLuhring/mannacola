//
//  Game.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


class Game {
    var player1: AbleToPlay
    var player2: AbleToPlay
    var lastAssignedPlayerNumber: Int = 1
    
    init (player1: AbleToPlay, player2: AbleToPlay) {
        self.player1 = player1
        self.player2 = player2
    }
    
    func getNextAssignablePlayerNumber() -> Int {
        let numberAssignment = self.lastAssignedPlayerNumber
        self.lastAssignedPlayerNumber++
        
        return numberAssignment
    }
    
    func getReceptacleAfter(receptacle: AbleToReceiveStones) throws -> AbleToReceiveStones {
        var nextReceptacle: AbleToReceiveStones? = nil
        let currentPosition = receptacle.position
        
        guard let receptacleOwner = receptacle.owner else {
            throw GameError.OwnerNotSet
        }

        switch receptacle.receptacleType {
        case .Pocket:
            if currentPosition >= 1 && currentPosition <= 5 {
                // If position is 1-5, increment position by one
                nextReceptacle = receptacleOwner.pocketSet[currentPosition + 1]
            } else if currentPosition == 6 {
                // If position is 6, next position is pocket owner's goal
                nextReceptacle = receptacleOwner.goal
            } else {
                throw GameError.InvalidPocketPosition
            }
        case .Goal:
            // If position is goal, next position is opponent's pocket number 1
            if let opponent = receptacleOwner.opponent {
                nextReceptacle = opponent.pocketSet[1]
            } else {
                throw GameError.NoOpponentForReceptacleOwner
            }
        }
        
        if nextReceptacle == nil {
            throw GameError.FailedToSetNextReceptacle
        }
        
        return nextReceptacle!
    }
    
    func getOpponentOf(player: AbleToPlay) -> AbleToPlay {
        if player.playerNumber == self.player1.playerNumber {
            return self.player2
        } else {
            return self.player1
        }
    }
}

enum GameError: ErrorType {
    case OwnerNotSet
    case InvalidPocketPosition
    case FailedToSetNextReceptacle
    case NoOpponentForReceptacleOwner
}