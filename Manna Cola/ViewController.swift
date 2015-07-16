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
        
        // Disable all sides who aren't the active player (current turn)
        let numberOfPlayerWithCurrentTurn = self.game.currentTurn.id
        disableAllSidesExcept(numberOfPlayerWithCurrentTurn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var goalForPlayer0: UILabel!
    @IBOutlet weak var goalForPlayer1: UILabel!

    @IBOutlet weak var player0pocket6: UIButton!
    @IBAction func selectedSide0Pocket6(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(6, OnSideNumber: 0)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player0pocket5: UIButton!
    @IBAction func selectedSide0Pocket5(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(5, OnSideNumber: 0)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player0pocket4: UIButton!
    @IBAction func selectedSide0Pocket4(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(4, OnSideNumber: 0)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player0pocket3: UIButton!
    @IBAction func selectedSide0Pocket3(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(3, OnSideNumber: 0)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player0pocket2: UIButton!
    @IBAction func selectedSide0Pocket2(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(2, OnSideNumber: 0)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player0pocket1: UIButton!
    @IBAction func selectedSide0Pocket1(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(1, OnSideNumber: 0)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player1pocket6: UIButton!
    @IBAction func selectedSide1Pocket6(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(6, OnSideNumber: 1)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player1pocket5: UIButton!
    @IBAction func selectedSide1Pocket5(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(5, OnSideNumber: 1)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player1pocket4: UIButton!
    @IBAction func selectedSide1Pocket4(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(4, OnSideNumber: 1)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player1pocket3: UIButton!
    @IBAction func selectedSide1Pocket3(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(3, OnSideNumber: 1)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player1pocket2: UIButton!
    @IBAction func selectedSide1Pocket2(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(2, OnSideNumber: 1)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    @IBOutlet weak var player1pocket1: UIButton!
    @IBAction func selectedSide1Pocket1(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(1, OnSideNumber: 1)
        } catch {
            displayGameOverAlert()
        }
        
        humanTurnIsEnding()
    }
    
    func updateCountsOnControls() {
        let side0pockets = self.game.board.sides[0].pockets
        let side1pockets = self.game.board.sides[1].pockets
        
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
    
    func displayGameOverAlert() {
        let alert = UIAlertController(title: "Game has been forfeited by player", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func humanTurnIsEnding() {
        var turnTakenByAI: Bool
        
        // Perform post-turn checks
        
        // Is game over?
        
        // NEXT TURN BEGINNING!
        
        turnTakenByAI = launchNextTurn()
        
        // If an AI player took a turn, launch another turn
        if turnTakenByAI {
            launchNextTurn()
        }
    }
    
    func launchNextTurn() -> Bool {     // Returns whether or not turn is being taken by an AI (true if AI)
        var numberOfActiveSide: Int?
        
        do {
            numberOfActiveSide = try self.game.nextPlayerTakesTurn()
        } catch {
            displayGameOverAlert()
        }
        
        // Update counts on controls
        updateCountsOnControls()
        
        // Disable side of inactive player
        disableAllSidesExcept(numberOfActiveSide)
        
        if numberOfActiveSide == nil {
            return true
        } else {
            return false
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
}
