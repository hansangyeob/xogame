//
//  mainGame.swift
//  xogame (iOS)
//
//  Created by Sang Yeob Han  on 25/08/2022.
//

import SwiftUI

let defaultTimeRemaining:CGFloat = 20
let lineWidth:CGFloat = 20
let radius:CGFloat = 5

struct mainGame: View {
    
    @State public var highestScore = 0;
     @State public var timeRemaining:CGFloat = defaultTimeRemaining
     @State public var isActive = false
     @State private var endGameText = "Get 5 score ASAP!"
     @State private var gameEnded = false
     @State private var correctAnswer = 0
     @State private var choiceArray : [Int] = [0, 1, 2, 3]
     @State private var firstNumber = 0
     @State private var secondNumber = 0
     @State private var difficulty = 1000
     @State private var score = 0
     
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {

        VStack{
            Text(endGameText)
                     .alert(endGameText,isPresented: $gameEnded){
                         Button("Reset", role: .destructive, action:resetGame)
                     }
            
            Spacer()
            
            ZStack{
                
                Circle()
                    .stroke(Color.gray.opacity(0.2),style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .frame(width: 90, height: 90)
                Circle()
                    .trim(from: 0, to: 1 - ((defaultTimeRemaining-timeRemaining)/defaultTimeRemaining))
                    .stroke(timeRemaining > 10 ? Color.green:
                                timeRemaining > 5 ? Color.yellow
                            :Color.red
                            ,style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .frame(width: 90, height: 90)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut)
                Text("\(Int(timeRemaining))")
                    .font(.title)
            }.frame(width: radius * 2, height: radius * 2)
            
            Spacer()
            //btn
            HStack{
                Label("\(isActive ? "pause" : "Play")"
                      ,systemImage:"\(isActive ? "pause.fill" : "play.fill")"
                    )
                    .foregroundColor(isActive ? .red : .yellow)
                    .font(.title)
                    .onTapGesture(perform:{
                        isActive.toggle()
                        SoundManager.instance.playSound(sound:.dingSound)
                    })
                Label("Resume",systemImage: "backward.fill")
                    .foregroundColor(.black)
                    .font(.title)
                    .onTapGesture(perform:{
                                    isActive = false
                                    timeRemaining = defaultTimeRemaining
                        score = 0
                             
                    })
            }.onReceive(timer, perform:{ _ in
                    guard isActive else{return}
            if timeRemaining > 0{
                timeRemaining -= 1
            }else{
                isActive = false
                timeRemaining =
                defaultTimeRemaining
                
                endGameText = "Timeout!"
                gameEnded = true
            }
        })

            Spacer()
            
        //game body
            VStack {
                
                Text("\(firstNumber) + \(secondNumber)")
                    .font(.largeTitle)
                    .bold()
                
                HStack {
                    ForEach(0..<2) {index in
                        Button {
                            answerIsCorrect(answer: choiceArray[index])
                            generateAnswers()
                            isActive.toggle()
                            
                        } label: {
                            AnswerBtn(number: choiceArray[index])
                        }.onTapGesture(perform:{
                            isActive.toggle()
      
                        })
                    }
                }
                
                HStack {
                    ForEach(2..<4) {index in
                        Button {
                            answerIsCorrect(answer: choiceArray[index])
                            generateAnswers()
                            isActive.toggle()
                        } label: {
                            AnswerBtn(number: choiceArray[index])
                        }.onTapGesture(perform:{
                            isActive.toggle()
   
                        })
                    }
                }
                Text("Score: \(score)")
                    .font(.headline)
                    .bold()
                Text("Highest Score: \(highestScore)")
                    .font(.headline)
                    .bold()
            }.onAppear(perform: generateAnswers)
            

        //game body end
            
            Spacer()

        }
    }
    
    func resetGame(){
            endGameText = "Get 5 score ASAP!"
            score = 0
        }

    
  


    func answerIsCorrect(answer: Int){
        if answer == correctAnswer {
            self.score += 1
            self.highestScore += 1
            SoundManager.instance.playSound(sound: .grindrNotification)
            if score > 5{
                endGameText = "YOU are pretty SMART!"
                gameEnded = true
                isActive = false
                timeRemaining = defaultTimeRemaining
            }
            if (score > highestScore){
                highestScore = score
            }
            
        } else {
            self.score -= 1
            SoundManager.instance.playSound(sound: .dingSound)
            if score < -3{
                endGameText = "YOU are so BAD at this!"
                gameEnded = true
                isActive = false
                timeRemaining = defaultTimeRemaining
            }
        }
    }


    func generateAnswers(){
        firstNumber = Int.random(in: 0...(difficulty/3))
        secondNumber = Int.random(in: 0...(difficulty/2))
        var answerList = [Int]()
        correctAnswer = firstNumber + secondNumber
        for i in 0...2 {
            answerList.append(Int.random(in: 0...difficulty))
        }
        answerList.append(correctAnswer)
        choiceArray = answerList.shuffled()
    }
}


struct mainGame_Previews: PreviewProvider {
    static var previews: some View {
        mainGame()
    }
}
