//
//  AbleToReceiveStones.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/10/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


protocol AbleToReceiveStones {
    var count: Int { get set }
    var position: Int { get }
    var receptacleType: ReceptacleType { get }
}

enum ReceptacleType {
    case Pocket
    case Goal
}