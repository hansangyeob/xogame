//
//  timer.swift
//  xogame (iOS)
//
//  Created by Sang Yeob Han  on 26/08/2022.
//
//
//import UIKit
//
//class timer: UIViewController{
//    @IBOutlet weak var label: UILabel!
//    
//    
//    var timeremaining: Int = 10
//    var timer:Timer!
//    
//    override func viewDidLoad(){
//        super.viewDidLoad()
//    }
//    
//    @IBAction func playTapped(_ sender:Any){
//        timer = Timer.scheduledTimer(timeInterval: 1, target: <#T##Any#>, selector: #selector(step), userInfo: nil, repeats: true)
//    }
//
//    @IBAction func pauseTapped(_ sender:Any){
//        timer.invalidate()
//    }
//    @IBAction func resetTapped(_ sender:Any){
//        timer.invalidate()
//        timeremaining = 10
//        label.text = "\(timeremaining)"
//    }
//    
//    @objc func step(){
//        if timeremaining > 0{
//            timeremaining -= 1
//        }else{
//            timer.invalidate()
//            timeremaining = 10
//        }
//        label.text = "\(timeremaining)"
//    }
//    
//    
//}
