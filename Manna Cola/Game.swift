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
    var currentTurn: Player
    
    init () {
        self.board = Board(numberOfSides: 2)
        
        // Add two players
        self.players.append(Player(type: PlayerType.Human, id: 0))
        self.players.append(Player(type: PlayerType.Human, id: 1))
        
        let numberOfPlayerWithFirstTurn = 0 // Use this as a config, or set it to random one day
        
        self.currentTurn = players[numberOfPlayerWithFirstTurn]
    }
    
    func newTurn() throws -> Int? {    // Returns the side number that should be enabled in the VC, if any
        // Switch current turn to next player
        self.currentTurn = getNextPlayer(self.currentTurn)
        
        switch self.currentTurn.type {
        case .AI:
            // Use this player's strategy to select a pocket
            guard let strategyForCurrentTurn = self.currentTurn.strategy else {
                throw GameError.NoStrategyForAIPlayer
            }
            
            let selectedPocketNumber = strategyForCurrentTurn.hasReceivedTurn(self.board)
            let selectedSideNumber = self.currentTurn.id // i.e. the player's own side
            
            
            // Try to select this pocket. If the pocket is empty, the player loses automatically
            do {
                try self.board.someoneHasSelectedPocket(selectedPocketNumber, OnSideNumber: selectedSideNumber)
            } catch BoardError.EmptyPocket {
                throw GameError.GameForfeitedViaEmptyPocketSelection
            } catch {
                throw GameError.StrategySelectedNonexistentPocket
            }
            
            return nil
            
        case .Human:
            // Return the int of the player's side that should be enabled (We'll wait for the human)
            let sideNumberOfPlayerWithCurrentTurn = self.currentTurn.id
            
            return sideNumberOfPlayerWithCurrentTurn
        }
    }
    
    func getNextPlayer(previousPlayer: Player) -> Player {
        let numberOfFinalPlayer = self.players.count - 1
        let nextPlayer: Player
        
        // If we're at the highest numbered player, reset to player 0, otherwise increment player number
        if previousPlayer === self.players[numberOfFinalPlayer] {
            nextPlayer = self.players[0]
        } else {
            let previousPlayerNumber = previousPlayer.id
            nextPlayer = self.players[previousPlayerNumber + 1]
        }
        
        return nextPlayer
    }
    
    func performPostTurnChecks() throws {
        
    }
}

enum GameError: ErrorType {
    case NoStrategyForAIPlayer
    case GameForfeitedViaEmptyPocketSelection
    case StrategySelectedNonexistentPocket
}