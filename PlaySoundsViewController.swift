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
    var receivedAudio:RecordedAudio!
    
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do { audioPlayer = try AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, fileTypeHint: nil) } catch _ { return print("file not found") }
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
        
    }

    @IBAction func playSlowAudio(sender: UIButton) {
        
        playAudioWithVariableRate(0.5)
        
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        
        playAudioWithVariableRate(1.5)
        
    }

    @IBAction func playChipmunkAudio(sender: UIButton) {
        
        playAudioWithVariablePitch(1000)
        
    }

    @IBAction func playDarthVaderAudio(sender: UIButton) {
        
        playAudioWithVariablePitch(-1000)
        
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        
        initializePlayerAndEngine()
        
    }
    
    func playAudioWithVariableRate(rate: float_t){
        
        audioPlayer.currentTime = 0.0
        initializePlayerAndEngine()
        audioPlayer.rate = rate
        audioPlayer.play()

    }
    
    func playAudioWithVariablePitch(pitch: float_t){
        
        initializePlayerAndEngine()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        audioPlayerNode.play()
        
    }
    
    func initializePlayerAndEngine (){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
}
