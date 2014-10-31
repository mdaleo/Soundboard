//
//  SoundListViewController
//  Soundboard
//
//  Created by MacBook on 10/31/14.
//  Copyright (c) 2014 MacBook. All rights reserved.
//

import UIKit
import AVFoundation

class SoundListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var audioPlayer = AVAudioPlayer()
    
    var sounds: [Sound] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // My own code and sniz
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        var soundPath = NSBundle.mainBundle().pathForResource("thumpy", ofType: "m4a")
        var soundURL = NSURL.fileURLWithPath(soundPath!)
        
        var sound1 = Sound()
        sound1.name = "Sound 1 name"
        sound1.URL = soundURL!
        
        var sound2 = Sound()
        sound2.name = "Turndown for what"
        sound2.URL = soundURL!
        
        self.sounds.append(sound1)
        self.sounds.append(sound2)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sounds.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var sound = self.sounds[indexPath.row]
        var cell = UITableViewCell()
        cell.textLabel.text = sound.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var soundPath = NSBundle.mainBundle().pathForResource("thumpy", ofType: "m4a")
        var soundURL = NSURL.fileURLWithPath(soundPath!)
        self.audioPlayer = AVAudioPlayer(contentsOfURL: soundURL, error: nil)
        self.audioPlayer.play()
    }


}

