//
//  ComputerStrategy.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

protocol ComputerStrategy {
    func hasReceivedTurn(board: Board) -> Int
}