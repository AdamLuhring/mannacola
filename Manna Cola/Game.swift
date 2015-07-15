//
//  Game.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


class Game {
    var sides = [Side]()
    var players = [AbleToPlay]()
    var goals: [Goal] = [Goal(), Goal()]
    var lastAssignedPlayerNumber: Int = 1
    
    init () {
        // Register players!  Do this using a separate class and dependency injection
        (players[1], players[2]) = PlayerRegistrar.getTwoPlayers(self)
        
        // Set up sides
        let numberOfSides = 2
        let numberOfPocketsPerSide = 6
        
        for sideNumber in 1...numberOfSides {
            self.sides[sideNumber] = Side(id: sideNumber, numberOfPockets: numberOfPocketsPerSide)
        }
    }
    
    func getNextAssignablePlayerNumber() -> Int {
        let numberAssignment = self.lastAssignedPlayerNumber
        self.lastAssignedPlayerNumber++
        
        return numberAssignment
    }
    
    func emptyPocketForPlayer(player: AbleToPlay, pocketNumber: Int) throws {
        let pocket = self.sides[player.playerNumber].pockets[pocketNumber]
        let countOfSelectedPocket = pocket.count
        var currentReceptacle: AbleToReceiveStones
        var pile: MovingPile
        
        if countOfSelectedPocket > 0 {
            pile = pocket.empty()
        } else {
            throw GameError.CannotActOnAnEmptyPocket
        }
        
        // Move currentReceptacle to next position
        try! currentReceptacle = getReceptacleAfter(pocket, ofPlayer: player)
        
        while pile.count > 0 {
            
            // Make deposit to currentReceptacle
            try! pile.depositTo(&currentReceptacle)
            
            // Move currentReceptacle to next position
            try! currentReceptacle = getReceptacleAfter(pocket, ofPlayer: player)
        }
        
        return
    }

    func getReceptacleAfter(receptacle: AbleToReceiveStones, ofPlayer: AbleToPlay) throws -> AbleToReceiveStones {
        var nextReceptacle: AbleToReceiveStones
        let currentPosition = receptacle.position
        let sideOfPlayer = self.sides[ofPlayer.playerNumber]

        switch receptacle.receptacleType {
        case .Pocket:
            if currentPosition >= 1 && currentPosition <= 5 {
                // If position is 1-5, increment position by one
                nextReceptacle = sideOfPlayer.pockets[currentPosition + 1]
            } else if currentPosition == 6 {
                // If position is 6, next position is pocket owner's goal
                nextReceptacle = self.goals[ofPlayer.playerNumber]
            } else {
                throw GameError.InvalidPocketPosition
            }
        case .Goal:
            // If position is goal, next position is opponent's pocket number 1
            let opponentPlayerNumber = getOpponentOf(ofPlayer).playerNumber
            nextReceptacle = self.sides[opponentPlayerNumber].pockets[1]
        }
        
        return nextReceptacle
    }
    
    func getOpponentOf(player: AbleToPlay) -> AbleToPlay {
        let playerNumber = player.playerNumber
        
        if playerNumber == 1 {
            return self.players[2]
        } else {
            return self.players[1]
        }
    }
}

enum GameError: ErrorType {
    case InvalidPocketPosition
    case FailedToSetNextReceptacle
    case CannotActOnAnEmptyPocket
}