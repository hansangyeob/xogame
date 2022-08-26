//
//  CountdownTimer.swift
//  xogame (iOS)
//
//  Created by Sang Yeob Han  on 26/08/2022.
//

import SwiftUI

let defaultTimeRemaining:CGFloat = 6
let lineWidth:CGFloat = 20
let radius:CGFloat = 10

struct CountdownTimer: View {

    @State private var isActive = false
    @State private var timeRemaining:CGFloat = defaultTimeRemaining
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing:25){
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.2),style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .frame(width: 50, height: 50)
                Circle()
                    .trim(from: 0, to: 1 - ((defaultTimeRemaining-timeRemaining)/defaultTimeRemaining))
                    .stroke(timeRemaining>4 ? Color.green:
                                timeRemaining > 2 ? Color.yellow
                            :Color.red
                            ,style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                Text("\(Int(timeRemaining))")
                    .font(.title3)
            }.frame(width: radius * 2, height: radius * 2)
            HStack{
                Label("\(isActive ? "pause" : "Play")"
                      ,systemImage:"\(isActive ? "pause.fill" : "play.fill")"
                    )
                    .foregroundColor(isActive ? .red : .yellow)
                    .font(.caption)
                    .onTapGesture(perform:{
                        isActive.toggle()
                    })
                Label("Resume",systemImage: "backward.fill")
                    .foregroundColor(.black)
                    .font(.caption)
                    .onTapGesture(perform:{
                                    isActive = false
                                    timeRemaining = defaultTimeRemaining
                    })
            }
        }.onReceive(timer, perform:{ _ in
                    guard isActive else{return}
            if timeRemaining > 0{
                timeRemaining -= 1
            }else{
                isActive = false
                timeRemaining =
                defaultTimeRemaining
            }
        })
}
}
struct CountdownTimer_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimer()
    }
}

