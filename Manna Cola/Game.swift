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
    var playerWithCurrentTurn: Player
    
    init () {
        self.board = Board(numberOfSides: 2)
        let playerOne: Player, playerTwo: Player
        
        // Add two players
        (playerOne, playerTwo) = Player.registerTwoPlayers()
        self.players.append(playerOne)
        self.players.append(playerTwo)
        
        let numberOfPlayerWithFirstTurn = 0 // Use this as a config, or set it to random one day
        
        self.playerWithCurrentTurn = players[numberOfPlayerWithFirstTurn]
    }
    
    func nextPlayerTakesTurn() throws -> Int? {    // Returns the side number that should be enabled in the VC, if any
        // Switch current turn to next player
        self.playerWithCurrentTurn = getNextPlayer(self.playerWithCurrentTurn)
        
        switch self.playerWithCurrentTurn.type {
        case .AI:
            // Use this player's strategy to select a pocket
            guard let strategyForCurrentTurn = self.playerWithCurrentTurn.strategy else {
                throw GameError.NoStrategyForAIPlayer
            }
            
            let selectedPocketNumber = strategyForCurrentTurn.determinePocketSelectionForPlayer(playerWithCurrentTurn.id, board: self.board)
            let selectedSideNumber = self.playerWithCurrentTurn.id // i.e. the player's own side
            
            
            // Try to select this pocket. If the pocket is empty, the player loses automatically
            do {
                try self.board.playerHasSelectedPocket(playerWithCurrentTurn, pocketNumber: selectedPocketNumber, OnSideNumber: selectedSideNumber)
            } catch BoardError.EmptyPocket {
                throw GameError.GameForfeitedViaEmptyPocketSelection
            } catch {
                throw GameError.StrategySelectedNonexistentPocket
            }
            
            return nil
            
        case .Human:
            // Return the int of the player's side that should be enabled (We'll wait for the human)
            let sideNumberOfPlayerWithCurrentTurn = self.playerWithCurrentTurn.id
            
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