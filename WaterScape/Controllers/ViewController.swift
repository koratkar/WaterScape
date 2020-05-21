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
import MediaPlayer



class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpSound(soundName: "rainsound.wav")
    }
    
    var deleteThis = "a variable"
    var isOn: Bool = false
    var repeatForever = false
    
    let playing = UIImage(systemName: "bolt.fill")
    let paused = UIImage(systemName: "bolt")

    
    func setUpSound(soundName: String) {
        let path = Bundle.main.path(forResource: soundName, ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch {
            print("didn't work bro")
            isOn = false
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
        isOn = true
        playButton.setImage(playing, for: .normal)
    }
    
    func stopSound() {
        player!.pause()
        isOn = false
        playButton.setImage(paused, for: .normal)
    }
    
    
    
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func playButton(_ sender: Any) {
        if isOn == false {
            playSound()
        } else {
            stopSound()
        }
    }
    
    
    @IBOutlet var repeatLabel: UILabel!
    
    
    @IBAction func settingsPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToSettings", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSettings" {
            // Get the new view controller using segue.destination.
            let repeatLabel = self.repeatLabel
               // Pass the selected object to the new view controller.
            let settingsViewController = segue.destination as! SettingsViewController
            settingsViewController.repeatLabel = repeatLabel
        }
        
    }
    
    

    
    
    
    
    
    
    
}

