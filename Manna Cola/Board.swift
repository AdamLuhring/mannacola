//
//  Board.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/15/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import Foundation

class Board {
    var sides = [Side]()
    
    init (numberOfSides: Int) {
        let numberOfPocketsPerSide = 6
        
        for _ in 0...(numberOfSides - 1) {
            let newSide = Side(numberOfPockets: numberOfPocketsPerSide)
            sides.append(newSide)
        }
    }
    
    func someoneHasSelectedPocket(pocketNumber: Int, OnSideNumber: Int) throws {
        // Adjust board pocket counts to reflect how Mancala works.
        let selectedPocket = self.sides[OnSideNumber].pockets[pocketNumber]
        var currentSideNumber: Int, currentPocketNumber: Int, currentPocket: Pocket
        
        if selectedPocket.count < 1 {
            throw BoardError.EmptyPocket
        }
        
        // With the above check, we can now assume this was a legal game choice
        
        // Save the number of stones in this pocket, then empty the pocket
        var numberOfStonesRemainingInTransit = selectedPocket.count
        selectedPocket.count = 0
        
        // Save the address of the selected pocket (to be incremented)
        currentSideNumber = OnSideNumber
        currentPocketNumber = pocketNumber
        
        // While there are still stones left to move, deposit one at a time in each next pocket
        while numberOfStonesRemainingInTransit > 0 {
            // Move to the next pocket
            (currentSideNumber, currentPocketNumber) = try! getAddressOfNextPocket(currentSideNumber, currentPocketNumber: currentPocketNumber)
            currentPocket = self.sides[currentSideNumber].pockets[currentPocketNumber]
            
            // Transfer one stone from the moving pile to this pocket
            currentPocket.count++
            numberOfStonesRemainingInTransit--
        }
    }
    
    func getAddressOfNextPocket(currentSideNumber: Int, currentPocketNumber: Int) throws -> (Int, Int) {
        let nextSideNumber: Int, nextPocketNumber: Int
        
        // Make sure input values are non-negative
        if currentSideNumber < 0 {
            throw BoardError.SideNUmberTooLow
        }
        if currentPocketNumber < 0 {
            throw BoardError.PocketNumberTooLow
        }
        
        // Make sure side number is in range
        let maxAllowedSideNumber = self.sides.count - 1
        
        if currentSideNumber > maxAllowedSideNumber {
            throw BoardError.SideNumberTooHigh
        }
        
        // Make sure pocket number is in range, given identified side
        let maxAllowedPocketNumber = self.sides[currentSideNumber].pockets.count - 1
        
        if currentPocketNumber > maxAllowedPocketNumber {
            throw BoardError.PocketNumberTooHigh
        }
        
        // We can now assume the input integers are valid
        
        // If the pocket number is 0, we move to the next side's highest-numbered pocket
        if currentPocketNumber == 0 {
            nextSideNumber = getNumberOfNextSide(currentSideNumber)
            nextPocketNumber = self.sides[nextSideNumber].pockets.count - 1
        } else {
            nextSideNumber = currentSideNumber
            nextPocketNumber = currentPocketNumber - 1
        }
        
        return (nextSideNumber, nextPocketNumber)
    }
    
    func getNumberOfNextSide(currentSideNumber: Int) -> Int {
        // If this is the highest-numbered side, the next side is 0. Otherwise, increment the side number.
        let highestNumberedSide = self.sides.count - 1
        let numberOfNextSide: Int
        
        if currentSideNumber == highestNumberedSide {
            numberOfNextSide = 0
        } else {
            numberOfNextSide = currentSideNumber + 1
        }
        
        return numberOfNextSide
    }
}

enum BoardError: ErrorType {
    case EmptyPocket
    case SideNumberTooHigh
    case SideNUmberTooLow
    case PocketNumberTooHigh
    case PocketNumberTooLow
}