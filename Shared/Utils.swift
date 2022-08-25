//
//  Utils.swift
//  xogame (iOS)
//
//  Created by Sang Yeob Han  on 25/08/2022.
//

import Foundation

func checkWinner(list:[String], letter:String) -> Bool{
    let winningSequence = [
    //todo
        [0,1,2,3,4],[5,6,7,8,9],[10,11,12,13,14],[15,16,17,18,19],[20,21,22,23,24],
        [0,6,12,18,24],[4,8,12,16,20],
        [0,5,10,15,20],[1,6,11,16,21],[2,7,12,17,22],[3,8,13,18,23],[4,9,14,19,24]
    ]
    
    for sequence in winningSequence{
        
        var score = 0
        
        for match in sequence{
            if list[match] == letter{
                score += 1
                
                if score == 5{
                    return true;
                }
            }
        }
     
    }
    return false;
}
