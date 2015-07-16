//
//  Pocket.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class Pocket {
    var count: Int
    let position: Int
    
    init (position: Int) {
        self.position = position
        if (position > 0) {
            self.count = 4
        } else {
            self.count = 0
        }
    }
}