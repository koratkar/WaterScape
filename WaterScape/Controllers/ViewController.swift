//
//  ViewController.swift
//  WaterScape
//
//  Created by Ishaan Koratkar on 5/7/20.
//  Copyright © 2020 Ishaan Koratkar. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

protocol audioControl {
    func setUpSound(soundName: String, numberOfRepeats: Int)
    func playSound()
    var repeatNumber: Int { get set }
}

class ViewController: UIViewController, audioControl {
    
    
    var player: AVAudioPlayer!
    var settingsViewController: SettingsViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //when you create a default without a value, it's default value is 0, but I can register a "default for my default"
        defaults.register(defaults: ["RepeatNumber": -1])
        let savedRepeat = defaults.integer(forKey: "RepeatNumber")
        
        setUpSound(soundName: "repeatTester.wav", numberOfRepeats: savedRepeat)
    }
    
    let defaults = UserDefaults.standard
    var repeatNumber = -1
    
    let playing = UIImage(systemName: "bolt.fill")
    let paused = UIImage(systemName: "bolt")
    
    
    func setUpSound(soundName: String, numberOfRepeats: Int) {
        let path = Bundle.main.path(forResource: soundName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = numberOfRepeats
        } catch {
            print("didn't work bro")
            
        }
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(AVAudioSession.Category.playback)
        } catch {
            print("something went wrong, chopper")
        }
        
    }
    
    func playSound() {
        player.play()
        playButton.setImage(playing, for: .normal)
    }
    
    
    func stopSound() {
        player.pause()
        playButton.setImage(paused, for: .normal)
    }
    
    
    
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func playButton(_ sender: Any) {
        if player.isPlaying == false {
            playSound()
        } else {
            stopSound()
        }
        
        //if content stops playbutton = offState thing added
    }
    
    //dead repeat forever label, add a real one
    @IBOutlet var repeatLabel: UILabel!
    
    
    @IBAction func settingsPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToSettings", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSettings" {
            // Get the new view controller using segue.destination.
            let repeatLabel = self.repeatLabel
            let repeatNumber = self.repeatNumber
            
               // Pass the selected object to the new view controller.
            let settingsViewController = segue.destination as! SettingsViewController
            settingsViewController.delegate = self
            settingsViewController.repeatLabel = repeatLabel
            settingsViewController.repeatNumber = repeatNumber
            settingsViewController.playerIsPlaying = player.isPlaying
            
            //delete me
            
          
        }
        
    }
    
    

    
    
    
    
    
    
    
}

