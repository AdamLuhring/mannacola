//
//  GameEndResult.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/19/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class GameEndResult {
    let outcome: Outcome
    let numberOfTurns: Int
    
    init (outcome: Outcome, numberOfTurns: Int) {
        self.outcome = outcome
        self.numberOfTurns = numberOfTurns
    }
}

enum Outcome {
    case Tie
    case WonBy(player: Player)
}