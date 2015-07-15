//
//  AbleToPlay.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


protocol AbleToPlay {
    var opponent: AbleToPlay? { get set }
    var game: Game { get }
    var playerNumber: Int { get }
    
    func hasReceivedTurn(currentState: BoardState) -> Int
}

extension AbleToPlay {
    func selectsOwnPocketNumbered(pocketNumber: Int) {
        do {
            try self.game.emptyPocketForPlayer(self, pocketNumber: pocketNumber)
        } catch {
            print("Something went wrong when player selected a pocket.")
        }
    }
}