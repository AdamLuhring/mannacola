//
//  ViewController.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tryResumingGameTurnLoop()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var goalForPlayer0: UILabel!
    @IBOutlet weak var goalForPlayer1: UILabel!

    @IBOutlet weak var player0pocket6: UIButton!
    @IBAction func selectedSide0Pocket6(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 0, pocket: 6)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player0pocket5: UIButton!
    @IBAction func selectedSide0Pocket5(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 0, pocket: 5)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player0pocket4: UIButton!
    @IBAction func selectedSide0Pocket4(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 0, pocket: 4)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player0pocket3: UIButton!
    @IBAction func selectedSide0Pocket3(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 0, pocket: 3)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player0pocket2: UIButton!
    @IBAction func selectedSide0Pocket2(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 0, pocket: 2)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player0pocket1: UIButton!
    @IBAction func selectedSide0Pocket1(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 0, pocket: 1)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player1pocket6: UIButton!
    @IBAction func selectedSide1Pocket6(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 1, pocket: 6)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player1pocket5: UIButton!
    @IBAction func selectedSide1Pocket5(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 1, pocket: 5)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player1pocket4: UIButton!
    @IBAction func selectedSide1Pocket4(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 1, pocket: 4)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player1pocket3: UIButton!
    @IBAction func selectedSide1Pocket3(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 1, pocket: 3)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player1pocket2: UIButton!
    @IBAction func selectedSide1Pocket2(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 1, pocket: 2)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    @IBOutlet weak var player1pocket1: UIButton!
    @IBAction func selectedSide1Pocket1(sender: AnyObject) {
        if let message = game.humanHasMadeSelection(PocketAddress(side: 1, pocket: 1)) {
            displayMessageFromGame(message)
        } else {
            
        }
        
        tryResumingGameTurnLoop()
    }
    
    func updateCountsOnControls(toBoard board: Board) {
        let side0pockets = board.sides[0].pockets
        let side1pockets = board.sides[1].pockets
        
        self.setButtonTextToNumber(player0pocket6, number: side0pockets[6].count)
        self.setButtonTextToNumber(player0pocket5, number: side0pockets[5].count)
        self.setButtonTextToNumber(player0pocket4, number: side0pockets[4].count)
        self.setButtonTextToNumber(player0pocket3, number: side0pockets[3].count)
        self.setButtonTextToNumber(player0pocket2, number: side0pockets[2].count)
        self.setButtonTextToNumber(player0pocket1, number: side0pockets[1].count)
        self.setLabelTextToNumber(goalForPlayer0, number: side0pockets[0].count)
        
        self.setButtonTextToNumber(player1pocket6, number: side1pockets[6].count)
        self.setButtonTextToNumber(player1pocket5, number: side1pockets[5].count)
        self.setButtonTextToNumber(player1pocket4, number: side1pockets[4].count)
        self.setButtonTextToNumber(player1pocket3, number: side1pockets[3].count)
        self.setButtonTextToNumber(player1pocket2, number: side1pockets[2].count)
        self.setButtonTextToNumber(player1pocket1, number: side1pockets[1].count)
        self.setLabelTextToNumber(goalForPlayer1, number: side1pockets[0].count)
    }
    
    func setButtonTextToNumber(button: UIButton, number: Int) {
        let text = String(number)
        
        button.setTitle(text, forState: UIControlState.Normal)
        button.setTitle(text, forState: UIControlState.Disabled)
        
        // If there are no stones, this button needs to be disabled.
        if number < 1 {
            button.enabled = false
        } else {
            button.enabled = true
        }
    }
    
    func setLabelTextToNumber(label: UILabel, number: Int) {
        let text = String(number)
        
        label.text = text
    }
    
    func setControlEnabledState(enabledState: Bool, ForPlayerId: Int) {
        if ForPlayerId == 0 {
            player0pocket6.enabled = enabledState
            player0pocket5.enabled = enabledState
            player0pocket4.enabled = enabledState
            player0pocket3.enabled = enabledState
            player0pocket2.enabled = enabledState
            player0pocket1.enabled = enabledState
        }
        
        if ForPlayerId == 1 {
            player1pocket6.enabled = enabledState
            player1pocket5.enabled = enabledState
            player1pocket4.enabled = enabledState
            player1pocket3.enabled = enabledState
            player1pocket2.enabled = enabledState
            player1pocket1.enabled = enabledState
        }
    }
    
    func humanHasSelectedPocket(withAddress pocketAddress: PocketAddress) {
        let updatedBoard: Board
        let currentPlayer: Player
        var gameEndResult: GameEndResult?
        
        (updatedBoard, currentPlayer, gameEndResult) = game.processSelectionFromViewController(pocketAddress)
        
        // Has the game ended?
        if gameEndResult != nil {
            // The game has ended... deal with this.
            
            return
        }
        
        // The game hasn't ended, so let's update the ViewController.
        
        // Update the pocket counts
        self.updateCountsOnControls(toBoard: updatedBoard)
        
        // Disable pockets for the inactive side(s)
        self.disableAllSidesExcept(currentPlayer.id)
    }
    
    func displayGameOverAlert() {
        let alert = UIAlertController(title: "Game has been forfeited by player", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func displayMessageFromGame(message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "Okay!", style: UIAlertActionStyle.Cancel, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func tryResumingGameTurnLoop() {
        do {
            let reason = try game.proceedWithTurnLoop()
            if reason == ReasonForExitingTurnLoop.WaitingOnHuman {
                //self.waitForHumanSelectionOnSide(game.playerWithCurrentTurn.id)
            }
        } catch {
            self.displayMessageFromGame("Caught an error from turnLoop.")
        }
    }
    
    func disableAllSidesExcept(activeSideNumber: Int?) {
        let numberOfHighestSide = self.game.board.sides.count - 1
        
        for sideNumber in 0...(numberOfHighestSide) {
            if sideNumber != activeSideNumber {
                setControlEnabledState(false, ForPlayerId: sideNumber)
            }
        }
    }
    
//    func waitForHumanSelectionOnSide(sideNumber: Int) {
//        updateCountsOnControls()
//        disableAllSidesExcept(sideNumber)
//    }
}
