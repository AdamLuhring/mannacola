//
//  Side.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/14/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class Side {
    var pockets: [Pocket]
    
    init (numberOfPockets: Int) {
        var pocketSet = [Pocket]()
        
        for pocketNumber in 0...numberOfPockets {
            pocketSet.append(Pocket(position: pocketNumber))
        }
        
        self.pockets = pocketSet
    }
}