//
//  ViewController.swift
//  idm362-fkb23
//
//  Created by Fidel Boamah on 1/12/21.
//

import UIKit
// Add Audio and Video library
import AVFoundation

var myAudioPlayerObj = AVAudioPlayer()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let bckSound = Bundle.main.path(forResource: "nnwom/bck-s", ofType: "mp3")
        do {
            myAudioPlayerObj = try
            AVAudioPlayer(contentsOf: URL(fileURLWithPath: bckSound!))
            myAudioPlayerObj.prepareToPlay()
            print("Background music ready to go!")
        } catch {
            print(error)
        }
        
        print("playStopbcks")
        if (myAudioPlayerObj.isPlaying) {
            myAudioPlayerObj.stop()
        } else {
            myAudioPlayerObj.play()
        }
        
    } // viewDidLoad
    
    
    
    @IBAction func playStopbcks(_ sender: Any) {
        print("playStopbcks")
        if (myAudioPlayerObj.isPlaying) {
            myAudioPlayerObj.stop()
        }
    }
    
    @IBAction func pauseAlert(_ sender: Any) {
//        print("playStopbcks")
//        if (myAudioPlayerObj.isPlaying) {
//            myAudioPlayerObj.stop()
//        } else {
//            myAudioPlayerObj.play()
//        }
        
        let myAlertObj = UIAlertController(title: "Game Paused", message: "You have paused", preferredStyle: .actionSheet)
        
        myAlertObj.addAction(UIAlertAction(title: "Resume", style: .default, handler: {(UIAlertAction) in print("User has resumed the game")
            
        }))
        
        myAlertObj.addAction(UIAlertAction(title: "Exit", style: .destructive, handler: {(UIAlertAction) in print("User has exited the game")
            
        }))
        
        self.present(myAlertObj, animated: true)
        
        print("playStopbcks")
        if (myAudioPlayerObj.isPlaying==false) {
            myAudioPlayerObj.play()
        }

    }
    
    

} // viewcontroller end

