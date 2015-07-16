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
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player0pocket5: UIButton!
    @IBAction func selectedSide0Pocket5(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(5, OnSideNumber: 0)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player0pocket4: UIButton!
    @IBAction func selectedSide0Pocket4(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(4, OnSideNumber: 0)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player0pocket3: UIButton!
    @IBAction func selectedSide0Pocket3(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(3, OnSideNumber: 0)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player0pocket2: UIButton!
    @IBAction func selectedSide0Pocket2(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(2, OnSideNumber: 0)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player0pocket1: UIButton!
    @IBAction func selectedSide0Pocket1(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(1, OnSideNumber: 0)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player1pocket6: UIButton!
    @IBAction func selectedSide1Pocket6(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(6, OnSideNumber: 1)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player1pocket5: UIButton!
    @IBAction func selectedSide1Pocket5(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(5, OnSideNumber: 1)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player1pocket4: UIButton!
    @IBAction func selectedSide1Pocket4(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(4, OnSideNumber: 1)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player1pocket3: UIButton!
    @IBAction func selectedSide1Pocket3(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(3, OnSideNumber: 1)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player1pocket2: UIButton!
    @IBAction func selectedSide1Pocket2(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(2, OnSideNumber: 1)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
    }
    
    @IBOutlet weak var player1pocket1: UIButton!
    @IBAction func selectedSide1Pocket1(sender: AnyObject) {
        do {
            try game.board.someoneHasSelectedPocket(1, OnSideNumber: 1)
        } catch {
            print("Bad selection.")
        }
        
        updateCountsOnControls()
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
    }
    
    func setLabelTextToNumber(label: UILabel, number: Int) {
        let text = String(number)
        
        label.text = text
    }
    
    func setControlEnabled(enabled: Bool, ForPlayerId: Int) {
        if ForPlayerId == 0 {
            player0pocket6.enabled = enabled
            player0pocket5.enabled = enabled
            player0pocket4.enabled = enabled
            player0pocket3.enabled = enabled
            player0pocket2.enabled = enabled
            player0pocket1.enabled = enabled
        }
        
        if ForPlayerId == 1 {
            player1pocket6.enabled = enabled
            player1pocket5.enabled = enabled
            player1pocket4.enabled = enabled
            player1pocket3.enabled = enabled
            player1pocket2.enabled = enabled
            player1pocket1.enabled = enabled
        }
    }
}
