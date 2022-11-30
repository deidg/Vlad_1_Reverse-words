//
//protocol DisplayButtonState {
//    func displayButtonChange()
//}
//
//class Normal: DisplayButtonState {
//    func displayButtonChange() {
//        displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6)
//    }
//}
//
//class Active: DisplayButtonState {
//    func displayButtonChange() {
//        displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1)
//    }
//}
//
//class DisplayButtonClass: DisplayButtonState {
//    var currentState: DisplayButtonState = Normal()
//    
//    func displayButtonChange() {
//        currentState.displayButtonChange()
//    }
//}
//
////var displayButton = DisplayButtonClass()
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//////
//////  DisplayButton.swift
//////  Vlad_1_Reverse words
//////
//////  Created by Alex on 29.11.2022.
//////
////
////import UIKit
////
////protocol State {
////    func buttonPressed
////
////
//////    func normal(displayButton: DisplayButton)      // (кнопка -  класс кнопки)
//////    func selected(displayButton: DisplayButton)
//////    func clear(displayButton: DisplayButton)
////}
////
//////class DisplayButton: UIButton {
////
//////let image = UIImage(named: imageName)
//////let imageView = UIImageView(image: image!)
////
////    class Normal: State {
////
////        func buttonPressed(displayButton: <<error type>>) {
////            <#code#>
////        }
////
////        //State - протокол
////
//////        func normal(displayButton: DisplayButton) {
////////            var displayBtn = UIButton()
////////            displayBtn.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6)
//////            displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6) //стартовый цвет
////////            displayButton = displayBtn: UIButton
//////        }
////
//////        func selected(displayButton: DisplayButton) {
//////            displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1) //активный цвет
//////        }
////
//////        func clear(displayButton: DisplayButton) {
//////            displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1)
//////        }
//////    }
////
////    class Selected: State {
////
//////        func normal(displayButton: DisplayButton) {
//////            displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6) //стартовый цвет
//////        }
////
//////        func selected(displayButton: DisplayButton) {
//////            displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1) //активный цвет
//////        }
//////
//////        func clear(displayButton: DisplayButton) {
//////            displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1)
//////        }
//////    }
////
////
/////*
////class Clear: State {
////
////    func normal(displayButton: DisplayButton) {
////        displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6) //стартовый цвет
////    }
////
////    func selected(displayButton: DisplayButton) {
////        displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1) //активный цвет
////    }
////
////    func clear(displayButton: DisplayButton) {
////        displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1)
////    }
////}
////
////    */
////
////class DisplayButton: State {
//////        var buttonState: State
//////
//////        init() {
//////            self.buttonState = Normal()
//////        }
//////
//////    var displayButton = DisplayButton()
////
////
////        func set(state: State) {
////            self.state = state
////        }
////
//////        func waiting() {
//////            state.waiting(displayButton: self)
//////        }
//////
//////        func reverse() {
//////            state.reverse(displayButton: self)
//////        }
//////
//////        func clear() {
//////            state.reverse(displayButton: self)
//////        }
////    }
////
////
//////var displayButton = DisplayButton()
//////DisplayButton = UIButton
//////displayButton.backgroundColor
//////
//////    displa
////
////
////
////
////
////
