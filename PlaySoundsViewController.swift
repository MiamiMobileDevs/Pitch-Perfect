//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Roberto Arciniegas on 12/13/15.
//  Copyright © 2015 Roberto Arciniegas. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var filePathURL:NSURL = NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3")!
        do { audioPlayer = try AVAudioPlayer(contentsOfURL: filePathURL, fileTypeHint: nil) } catch _ { return print("file not found") }
        audioPlayer.enableRate = true
        
    }

    @IBAction func playSlowAudio(sender: UIButton) {
        
        playAudioWithVariableRate(0.5)
        
    }
    @IBAction func playFastAudio(sender: UIButton) {
        
        playAudioWithVariableRate(1.5)
        
    }


    @IBAction func stopAudio(sender: UIButton) {
        
        audioPlayer.stop()
        
    }
    
    func playAudioWithVariableRate(rate: float_t){
        
        audioPlayer.prepareToPlay()
        audioPlayer.stop()
        audioPlayer.rate = rate
        audioPlayer.play()
        
    }
}
