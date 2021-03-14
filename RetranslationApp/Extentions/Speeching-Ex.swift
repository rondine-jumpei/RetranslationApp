//
//  SpeakingDelegate.swift
//  RetranslationApp
//
//  Created by ろーんでぃね on 2021/03/07.
//

import UIKit
import AVFoundation

class Speeching {
    
    private let synthesizer = AVSpeechSynthesizer()
        
    func speaking(sentence: String, language: String) {
        let utterance = AVSpeechUtterance(string: sentence)
        
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate
        utterance.pitchMultiplier = 0.5
        utterance.preUtteranceDelay = 0.2

        synthesizer.speak(utterance)
        print("success")
    }
}
