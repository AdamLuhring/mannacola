//
//  LeftStrategy.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class LeftStrategy: Strategy {
    func determinePocketSelectionForPlayer(assignedPlayerId: Int, board: Board) -> Int {
        // Always choose the left-most available pocket
        let mySide = board.sides[assignedPlayerId]
        var pocketSelection: Int?
        
        for pocketNumber in 6...1 {
            if mySide.pockets[pocketNumber].count > 0 {
                pocketSelection = pocketNumber
                break
            }
        }
        
        if pocketSelection != nil {
            return pocketSelection!
        } else {
            return 0
        }
    }
}