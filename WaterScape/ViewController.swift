//
//  ViewController.swift
//  WaterScape
//
//  Created by Ishaan Koratkar on 5/7/20.
//  Copyright © 2020 Ishaan Koratkar. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    var isOn: Bool = false
    
    func playSound(soundName: String) {
        let path = Bundle.main.path(forResource: "rainsound.wav", ofType: nil)!
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
        
        player?.play()
        isOn = true
    }
    
    func stopSound() {
        if isOn == true {
            player?.stop()
            isOn = false
        }
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        if isOn == false {
        playSound(soundName: "rainsound.wav")
        } else {
            stopSound()
        }
    }
    
}

