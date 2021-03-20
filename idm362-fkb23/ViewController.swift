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
    @IBOutlet weak var Diffscrlabel: UILabel!
    @IBOutlet weak var Samescrlabel: UILabel!
    var samescore = 0
    var diffscore = 0
    
    
    @IBAction func playStopbcks(_ sender: Any) {
        if (myAudioPlayerObj.isPlaying) {
            myAudioPlayerObj.stop()
        } else {
            myAudioPlayerObj.play()
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
                    if (myAudioPlayerObj.isPlaying==false) {
                        myAudioPlayerObj.play()
                    } else {
                        myAudioPlayerObj.play()
                    }
        }))
        
        myAlertObj.addAction(UIAlertAction(title: "Restart", style: .destructive, handler: { [self](UIAlertAction) in print("User has exited the game")
            if (myAudioPlayerObj.isPlaying==false) {
                myAudioPlayerObj.play()
            } else {
                myAudioPlayerObj.play()
            }
            
            samescore = 0
            diffscore = 0
            Diffscrlabel.text = "0"
            Samescrlabel.text = "0"
            
        }))
        
        self.present(myAlertObj, animated: true)
        
//        print("playStopbcks")
//        if (myAudioPlayerObj.isPlaying==false) {
//            myAudioPlayerObj.play()
//        }

    }
    
    var timer = Timer()
    var D3 = false
    var D4 = false
    var S3 = false
    var S4 = false
//    var samescore = 0
//    var diffscore = 0
    
    // Different buttons
    @IBAction func D1(_ sender: Any) {
        print("D1 pressed")
        // start the timer
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func D2(_ sender: Any) {
        print("D2 pressed")
    }
    
    @IBAction func D3(_ sender: Any) {
        D3 = true
        print("D3 pressed, its value is \(D3)")
    }
    
    @IBAction func D4(_ sender: Any) {
        D4 = true
        print("D4 pressed, its value is \(D4)")
    }
    
    
    // Same buttons
    @IBAction func S1(_ sender: Any) {
        print("S1 pressed")
    }
    
    @IBAction func S2(_ sender: Any) {
        print("S2 pressed")
    }
    
    @IBAction func S3(_ sender: Any) {
        S3 = true
        print("S3 pressed, its value is \(S3)")
    }
    
    @IBAction func S4(_ sender: Any) {
        S4 = true
        print("S4 pressed, its value is \(S4)")
    }
    
    // Checking btn clicks
    func btnChecker() {
        if (D3 == true && S3 == true) {
            print("same wins")
            samescore = samescore + 1
            Samescrlabel.text = "\(samescore)"
        }
        
        else if (D4 == true && S4 == true) {
            print ("same wins")
            samescore = samescore + 1
            Samescrlabel.text = "\(samescore)"
        }
        
        else if (D3 == true && S4 == true) {
            print ("different wins")
            diffscore = diffscore + 1
            Diffscrlabel.text = "\(diffscore)"
        }
        
        else if (D4 == true && S3 == true) {
            print ("Different wins")
            diffscore = diffscore + 1
            Diffscrlabel.text = "\(diffscore)"
        }
        
        D3 = false
        D4 = false
        S3 = false
        S4 = false
        
    }
    
//    func reset () {
//        samescore = 0
//        diffscore = 0
//        Diffscrlabel.text = "0"
//        Samescrlabel.text = "0"
//    }
    
    func whowon() {
        
        if (samescore > 12) {
            print ("Working now")
            
            let myAlertObj = UIAlertController(title: "Same wins", message: "Sorry different!", preferredStyle: .actionSheet)
            
            myAlertObj.addAction(UIAlertAction(title: "Thank you", style: .default, handler: {(UIAlertAction) in print("User has resumed the game")

            }))
        
        }
    
    else if (diffscore > 12) {
    
    let myAlertObj = UIAlertController(title: "Different wins", message: "Sorry same!", preferredStyle: .actionSheet)
    
    myAlertObj.addAction(UIAlertAction(title: "Thank you", style: .default, handler: {(UIAlertAction) in print("User has resumed the game")

    }))
    }
        
    }

@objc func timerAction() {
    btnChecker()
    whowon()
//    print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz")
    print("\(samescore)")
    print("\(diffscore)")
}
    
//    func winner() {
//        btnChecker()
//    }

    
    
    
    
    
    
} // viewcontroller end

