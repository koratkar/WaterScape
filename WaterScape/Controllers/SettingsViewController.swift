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
        let savedRepeat = defaults.integer(forKey: "RepeatNumber")
        if savedRepeat == -1 {
            repeatSwitch.setOn(true, animated: false)
        } else {
            repeatSwitch.setOn(false, animated: false)
        }
       
    }
    
    
    
    let defaults = UserDefaults.standard
    
    
    
    
    var VCController = ViewController()
    var repeatLabel: UILabel?
    var repeatNumber: Int?
    var delegate: audioControl?
    var playerIsPlaying: Bool?
    var chosenSound = "repeatTester.wav"
    

    
    
    
    @IBOutlet weak var repeatSwitch: UISwitch!
    
    
    @IBAction func repeatSwitchPressed(_ sender: Any) {
        if repeatSwitch.isOn == true {
            //repeatNumber and text are changed
            repeatNumber = -1
            self.delegate?.repeatNumber = -1
            repeatLabel?.text = "on"
            defaults.set(repeatNumber, forKey: "RepeatNumber")
            
            if playerIsPlaying == true {
                self.delegate?.setUpSound(soundName: chosenSound, numberOfRepeats: repeatNumber!)
                self.delegate?.playSound()
            } else {
                self.delegate?.setUpSound(soundName: chosenSound, numberOfRepeats: repeatNumber!)
            }
            
            
            
        } else if repeatSwitch.isOn != true {
            repeatNumber = 0
            self.delegate?.repeatNumber = 0
            defaults.set(repeatNumber, forKey: "RepeatNumber")
            
            if playerIsPlaying == true {
                self.delegate?.setUpSound(soundName: chosenSound, numberOfRepeats: repeatNumber!)
                self.delegate?.playSound()
            } else {
                self.delegate?.setUpSound(soundName: chosenSound, numberOfRepeats: repeatNumber!)
            }
            
            
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
