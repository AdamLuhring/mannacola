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
    var turnLoopHasBeenInitiated = false
    var countOfTurns = 0
    
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
    
    func processSelectionFromViewController(selectedPocket: PocketAddress) -> (Board, Player, GameEndResult?) {
        let gameEndResult: GameEndResult? = nil // only set to nil temporarily
        
        // do some checks?
        
        self.playerWithCurrentTurnHasSelectedPocket(withPosition: selectedPocket.pocket)
        
        return (self.board, self.playerWithCurrentTurn, gameEndResult)
    }
    
    func playerWithCurrentTurnHasSelectedPocket(withPosition pocketNumber: Int) -> GameEndResult? {
        let gameEndResult: GameEndResult? = nil
        return gameEndResult
    }
    
    func proceedWithTurnLoop() throws -> ReasonForExitingTurnLoop? {
        var reasonForExitingTurnLoop: ReasonForExitingTurnLoop?
        
        repeat {
            if !turnLoopHasBeenInitiated {
                // Next player!
                self.advanceTurnToNextPlayer()
            } else {
                turnLoopHasBeenInitiated = true
            }
        
            // Process current turn
            
            switch self.playerWithCurrentTurn.type {
            case .Human:
                reasonForExitingTurnLoop = ReasonForExitingTurnLoop.WaitingOnHuman
            case .AI:
                // Use this player's strategy to select a pocket
                guard let strategyForCurrentTurn = self.playerWithCurrentTurn.strategy else {
                    throw GameError.NoStrategyForAIPlayer
                }
                
                let selectedPocketNumber = strategyForCurrentTurn.determinePocketSelectionForPlayer(playerWithCurrentTurn.id, board: self.board)
                let selectedSideNumber = self.playerWithCurrentTurn.id
                
                // Try to select this pocket.
                do {
                    try self.board.playerHasSelectedPocket(playerWithCurrentTurn, pocketNumber: selectedPocketNumber, OnSideNumber: selectedSideNumber)
                } catch BoardError.EmptyPocket {
                    throw GameError.GameForfeitedViaEmptyPocketSelection(byPlayer: self.playerWithCurrentTurn)
                } catch {
                    throw GameError.StrategySelectedNonexistentPocket
                }
            }
        } while reasonForExitingTurnLoop == nil
        
        return reasonForExitingTurnLoop
    }
    
    func humanHasMadeSelection(pocketAddress: PocketAddress) -> String? {
        var message: String?
        
        do {
            try board.playerHasSelectedPocket(self.playerWithCurrentTurn, pocketNumber: pocketAddress.pocket, OnSideNumber: pocketAddress.side)
        } catch {
            message = "There was an issue during pocket selection by human."
        }
        
        // evaluatePostMoveRules()
        
        return message
    }
    
    func advanceTurnToNextPlayer() {
        // Switch current turn to next player
        self.playerWithCurrentTurn = getNextPlayer(self.playerWithCurrentTurn)
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

enum ReasonForExitingTurnLoop {
    case GameOver
    case WaitingOnHuman
}

enum GameError: ErrorType {
    case NoStrategyForAIPlayer
    case GameForfeitedViaEmptyPocketSelection(byPlayer: Player)
    case StrategySelectedNonexistentPocket
}