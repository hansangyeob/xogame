//
//  ContentView.swift
//  Shared
//
//  Created by Sang Yeob Han  on 25/08/2022.
//

 //www.youtube.com/watch?v=2HVQyxXbzv8

import SwiftUI

struct ContentView: View {

    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        
        if currentPage == totalPages{
            mainGame()
        }else{
            guideScreen()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
