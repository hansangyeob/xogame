//
//  AnswerBtn.swift
//  xogame (iOS)
//
//  Created by Sang Yeob Han  on 28/08/2022.
//

import SwiftUI

struct AnswerBtn: View {
    var number : Int
    @State private var degrees = 0.0
    
    var body: some View {
        
        ZStack{
            Text("\(number)")
            .frame(width: 110, height: 110)
            .font(.system(size: 30, weight: .bold))
            .foregroundColor(Color.white)
            .background(Color.blue)
            .clipShape(Circle())
            .padding()
        }

        
    }

struct AnswerBtn_Previews: PreviewProvider {
    static var previews: some View {
        AnswerBtn(number: 1300)
    }
}
}
