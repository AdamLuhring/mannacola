//
//  Pocket.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


class Pocket : AbleToReceiveStones {
    var count: Int = 4
    let position: Int
    let receptacleType = ReceptacleType.Pocket
    
    init (position: Int) {
        self.position = position
    }
    
    func empty() -> MovingPile {
        let pile = MovingPile(count: self.count)
        
        self.count = 0
        
        return pile
    }
}