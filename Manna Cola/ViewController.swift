//
//  ViewController.swift
//  Manna Cola
//
//  Created by Dan Luhring on 7/8/15.
//  Copyright © 2015 Dan Luhring. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.p1pos1.setTitle("1", forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var goalForPlayer1: UILabel!
    @IBOutlet weak var goalForPlayer2: UILabel!

    @IBOutlet weak var p1pos1: UIButton!
    @IBAction func p1SelectedPos1(sender: AnyObject) {
        
    }
    
    @IBOutlet weak var p1pos2: UIButton!
    @IBAction func p1SelectedPos2(sender: AnyObject) {
    }
    
    @IBOutlet weak var p1pos3: UIButton!
    @IBAction func p1SelectedPos3(sender: AnyObject) {
    }
    
    @IBOutlet weak var p1pos4: UIButton!
    @IBAction func p1SelectedPos4(sender: AnyObject) {
    }
    
    @IBOutlet weak var p1pos5: UIButton!
    @IBAction func p1SelectedPos5(sender: AnyObject) {
    }
    
    @IBOutlet weak var p1pos6: UIButton!
    @IBAction func p1SelectedPos6(sender: AnyObject) {
    }
    
    @IBOutlet weak var p2pos1: UIButton!
    @IBAction func p2SelectedPos1(sender: AnyObject) {
    }
    
    @IBOutlet weak var p2pos2: UIButton!
    @IBAction func p2SelectedPos2(sender: AnyObject) {
    }
    
    @IBOutlet weak var p2pos3: UIButton!
    @IBAction func p2SelectedPos3(sender: AnyObject) {
    }
    
    @IBOutlet weak var p2pos4: UIButton!
    @IBAction func p2SelectedPos4(sender: AnyObject) {
    }
    
    @IBOutlet weak var p2pos5: UIButton!
    @IBAction func p2SelectedPos5(sender: AnyObject) {
    }
    
    @IBOutlet weak var p2pos6: UIButton!
    @IBAction func p2SelectedPos6(sender: AnyObject) {
    }
}

