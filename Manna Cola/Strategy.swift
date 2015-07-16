//
//  Strategy.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

protocol Strategy {
    func determinePocketSelectionForPlayer(assignedPlayerId: Int, board: Board) -> Int
}