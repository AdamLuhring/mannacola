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
        var pocketSelection: Int?, pocketNumber: Int = 6
        
        while pocketNumber > 0 {
            if mySide.pockets[pocketNumber].count > 0 {
                pocketSelection = pocketNumber
                break
            }
            
            pocketNumber--
        }
        
        if pocketSelection != nil {
            return pocketSelection!
        } else {
            return 0
        }
    }
}