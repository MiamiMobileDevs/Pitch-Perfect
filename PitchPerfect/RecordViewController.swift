//
//  RecordViewController.swift
//  PitchPerfect
//
//  Created by Roberto Arciniegas on 12/13/15.
//  Copyright © 2015 Roberto Arciniegas. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func starRecordAudio(sender: UIButton) {
        stopButton.hidden = false
        recordingLabel.hidden = false
        startButton.hidden = true
        
    }

    @IBAction func stopRecording(sender: UIButton) {
        startButton.hidden = false
        recordingLabel.hidden = true
        stopButton.hidden = true
    }
}

