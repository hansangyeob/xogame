//
//  XOButton.swift
//  xogame (iOS)
//
//  Created by Sang Yeob Han  on 25/08/2022.


import SwiftUI

struct XOButton: View {
    //letter we insert (o,x)
    @Binding var letter: String
    //fleep amination
    @State private var degrees = 0.0
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width:70,height:70)
                .foregroundColor(.yellow)
            Circle()
                .frame(width:60,height: 60)
                .foregroundColor(.white)
            Text(letter)
                .font(.system(size:40))
                .bold()
        }
        .rotation3DEffect(.degrees(degrees), axis: (x:1,y:0,z:0))
        .simultaneousGesture(
            TapGesture()
                .onEnded{_ in
                    withAnimation(.easeIn(duration: 0.25)){
                        self.degrees -= 180
                    }
                })
    }
}

struct XOButton_Previews: PreviewProvider {
    static var previews: some View {
        XOButton(letter: . constant("X"))
    }
}
