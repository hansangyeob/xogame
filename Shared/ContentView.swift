//
//  ContentView.swift
//  Shared
//
//  Created by Sang Yeob Han  on 25/08/2022.
//

import SwiftUI

struct ContentView: View {
    //5*5
    @State private var moves=["","","","","",
                              "","","","","",
                              "","","","","",
                              "","","","","",
                              "","","","",""]
//    @State private var moves=[
//                              "","","",
//                              "","","",
//                              "","",""]
    
    @State private var endGameText = "TicTacToe!"
    @State private var gameEnded = false
    private var ranges = [(0..<5),(5..<10),(10..<15),(15..<20),(20..<25)]
//    private var ranges = [(0..<3),(3..<6),(6..<9)]

    var body: some View {
        VStack{
            
            Text(endGameText)
                .alert(endGameText,isPresented: $gameEnded){
                    Button("Reset", role: .destructive, action:resetGame)
                }
            
            Spacer()
            
            //game body
            ForEach(ranges,id: \.self){ range in
                HStack{
                    ForEach(range, id: \.self){i in
                        XOButton(letter: $moves[i])
                            .simultaneousGesture(
                            TapGesture()
                                .onEnded{_ in
                                    playerTap(index:i)
                                }
                            )
                    }
                }
            }
            
            Spacer()
            
            Button("Reset", action: resetGame)
            
        }
    }
    
    func resetGame(){
        endGameText = "TicTacToe!"
        moves=["","","","","",
              "","","","","",
              "","","","","",
              "","","","","",
              "","","","",""]
    }
    
    func playerTap(index: Int){
        if moves[index] == ""{
            moves[index] = "X"
            botMove()
        }
        
        //check if player or bot has won
        for letter in ["X","O"]{
            if checkWinner(list: moves, letter: letter){
                endGameText = "\(letter) has won!"
                gameEnded = true
                break
            }
        }
    }
    
    func botMove(){
        var avaliablMoves: [Int] = []
        var movesLeft = 0
        
        for move in moves{
            if move == ""{
                avaliablMoves.append(movesLeft)
            }
            movesLeft += 1
        }
        
        if avaliablMoves.count != 0{
            moves[avaliablMoves.randomElement()!] = "O"
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
