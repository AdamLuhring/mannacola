//
//  Goal.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/10/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


class Goal: AbleToReceiveStones {
    var count: Int = 0
    let receptacleType = ReceptacleType.Goal
    let position: Int = 0
    var owner: AbleToPlay?
    
    init (owner: AbleToPlay) {
        self.owner = owner
    }
}