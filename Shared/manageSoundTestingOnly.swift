//
//  manageSound.swift
//  xogame (iOS)
//
//  Created by Sang Yeob Han  on 25/08/2022.
//

import SwiftUI
import AVKit


class SoundManager{
    //sigliten
    static let instance = SoundManager();
    
    var player: AVAudioPlayer?
    
    enum soundOption:String{
        case dingSound
        case doorKnock
        case Doorknock
        case CorrectSound
        case grindrNotification
    }
    
    func playSound(sound: soundOption){
        //set up player
        guard let url = Bundle.main.url(forResource: sound.rawValue , withExtension: ".mp3")else{return}
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }catch let error{
            print("error playing sound \(error.localizedDescription)")
        }
    }
}


struct manageSound: View {
    
    var body: some View {
        VStack{
            Button("1"){
                SoundManager.instance.playSound(sound: .grindrNotification)
            }
            Button("2"){
                SoundManager.instance.playSound(sound: .doorKnock)
            }
        }
    }
}

struct manageSound_Previews: PreviewProvider {
    static var previews: some View {
        manageSound()
    }
}

