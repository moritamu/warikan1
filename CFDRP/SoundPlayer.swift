//
//  SoundPlayer.swift
//  MyMusic1
//
//  Created by 森田晋 on 2021/11/25.
//

import UIKit
import AVFoundation

class SoundPlayer: NSObject {
    let cymbalData = NSDataAsset(name: "cymbalSound")!.data
    var cymbalPlayer: AVAudioPlayer!
    
    let guitarData = NSDataAsset(name: "guitarSound")!.data
    var guitarPlayer: AVAudioPlayer!
    
    func cymbalPlay() {
//    tryでエラー処理をしろとのエラーが出る
        do {
            cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            
            cymbalPlayer.play()
        } catch {
            print("シンバルでエラー")
        }
    }

    func guitarPlay() {
//    tryでエラー処理をしろとのエラーが出る
        do {
            guitarPlayer = try AVAudioPlayer(data: guitarData)
            
            guitarPlayer.play()
        } catch {
            print("ギターでエラー")
        }
    }
    

}
