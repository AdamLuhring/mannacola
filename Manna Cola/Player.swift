//
//  Player.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class Player {
    let type: PlayerType
    let id: Int
    let strategy: Strategy?
    
    init (type: PlayerType, id: Int, strategy: Strategy? = nil) {
        self.type = type
        self.id = id
        self.strategy = strategy
    }
}

enum PlayerType {
    case Human
    case AI
}