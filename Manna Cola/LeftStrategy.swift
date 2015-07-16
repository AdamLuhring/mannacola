//
//  LeftStrategy.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class LeftStrategy: Strategy {
    func hasReceivedTurn(board: Board) -> Int {
        return 6
    }
}