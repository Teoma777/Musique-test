//
//  SoundPlayer.swift
//  Musique test
//
//  Created by Manon Leghait on 20/05/2020.
//  Copyright © 2020 thomas groux. All rights reserved.
//

import AVFoundation
var audioPlayer : AVAudioPlayer?

func playSound (music: String, type: String) {
    if let sound = Bundle.main.path(forResource: music, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            audioPlayer?.play()
            print("sound play")
        }
        catch {
            print(error)
        }
    }
    
}
func stopSound (music: String, type: String) {
    if let sound = Bundle.main.path(forResource: music, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
            audioPlayer?.stop()
            print("sound play")
        }
        catch {
            print(error)
        }
    }
    
}
