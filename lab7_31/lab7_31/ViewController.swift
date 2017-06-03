//
//  ViewController.swift
//  lab7_31
//
//  Created by robert on 4/24/17.
//  Copyright (c) 2017 di. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchIndicator: UILabel!
    @IBOutlet weak var backgroundSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        switchIndicator.textColor = UIColor.whiteColor()
        switchIndicator.text = "Background image: bg1.jpg"
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1"))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backgroundSwitchTapped(sender: AnyObject) {
        if backgroundSwitch.on
        {
            switchIndicator.text = "Background image: bg1.jpg"
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1"))
        }
        else
        {
            switchIndicator.text = "Background image: bg2.jpg"
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2"))
        }

    }

}

