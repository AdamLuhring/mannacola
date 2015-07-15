//
//  MovingPile.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/10/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


class MovingPile {
    var count: Int
    
    init (count: Int) {
        self.count = count
    }
    
    func depositTo(inout receptacle: AbleToReceiveStones) -> Int {
        if self.count < 1 {
            // The pile is empty, can't do anything
            print("Pile is empty! Nothing to do.")
        } else {
            // Transfer a stone from the moving pile to the receptacle
            receptacle.count = receptacle.count + 1
            self.count = self.count - 1
        }
        
        return self.count
    }

}