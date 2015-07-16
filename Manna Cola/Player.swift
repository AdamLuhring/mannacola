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
    
    init (type: PlayerType, id: Int) {
        self.type = type
        self.id = id
    }
}

enum PlayerType {
    case Human
    case AI
}