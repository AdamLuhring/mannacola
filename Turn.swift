//
//  Turn.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/17/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class Turn {
    let takenBy: Player
    let playerAwardedAdditionalTurn: Bool
    
    init (takenBy: Player, additionalTurn: Bool = false) {
        self.takenBy = takenBy
        self.playerAwardedAdditionalTurn = additionalTurn
    }
}