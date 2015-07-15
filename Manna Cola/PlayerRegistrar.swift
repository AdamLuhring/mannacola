//
//  PlayerRegistrar.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class PlayerRegistrar {
    static func getTwoPlayers(forGame: Game) -> (AnyPlayer, AnyPlayer) {
        var player1: AnyPlayer, player2: AnyPlayer
        
        // load the two players
        player1 = HumanPlayer(game: forGame)
        player2 = HumanPlayer(game: forGame)
        
        // set player opponents
        player1.opponent = player2
        player2.opponent = player1
        
        return (player1, player2)
    }
}

enum PlayerType {
    case Human
    case Computer
}