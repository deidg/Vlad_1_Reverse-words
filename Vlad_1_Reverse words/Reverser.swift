//
//  Reverser.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 11.12.2022.
//

import Foundation
import UIKit

public class Reverser {
//    var userText = UITextField()
//    var answerTextView = UITextView()
    
    public func reverseFunc(userText: String) -> String {
        let text = userText
           let reversedText = String(text.reversed())
//           answerTextView.text = reversedText
//        return answerTextView.text
        
     return reversedText
    }
}
