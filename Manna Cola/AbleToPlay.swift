//
//  AbleToPlay.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


protocol AbleToPlay {
    var opponent: AbleToPlay? { get set }
    var game: Game { get }
    var playerNumber: Int { get }
    
    func hasReceivedTurn()
    func emptiesPocket(pocketPositionNumber: Int)
}