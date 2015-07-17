//
//  PocketAddress.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/17/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

struct PocketAddress {
    let side: Int
    let pocket: Int
    
    init (side: Int, pocket: Int) {
        self.side = side
        self.pocket = pocket
    }
}