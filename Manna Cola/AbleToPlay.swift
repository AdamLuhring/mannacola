//
//  AbleToPlay.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation


protocol AbleToPlay {
    var pocketSet: [Pocket] { get set }
    var goal: Goal? { get set }
    var opponent: AbleToPlay? { get }
    var game: Game { get }
    var playerNumber: Int { get }
    
    func hasReceivedTurn()
    func emptiesPocket(pocketPositionNumber: Int)
}