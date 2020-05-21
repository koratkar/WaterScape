//
//  SettingsViewController.swift
//  WaterScape
//
//  Created by Ishaan Koratkar on 5/17/20.
//  Copyright © 2020 Ishaan Koratkar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    var VCController = ViewController()
    var repeatLabel: UILabel?
    
    @IBOutlet weak var repeatSwitch: UISwitch!
    
    
    @IBAction func repeatSwitchPressed(_ sender: Any) {
        if repeatSwitch.isOn == true {
            VCController.repeatForever = true
            repeatLabel?.text = "on"
        } else if repeatSwitch.isOn != true {
            VCController.repeatForever = false
            repeatLabel?.text = "off"
        }
    }
    
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
