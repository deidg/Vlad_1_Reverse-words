//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    
    let largeLabel = UILabel()
    let mainLabel = UILabel()
    var textField = UITextField()
    let divider = UILabel()
//        let divider = UIButton()
    var answerFieldLabel = UILabel()
    var displayButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//
//        largeLabel.translatesAutoresizingMaskIntoConstraints = false
//        mainLabel.translatesAutoresizingMaskIntoConstraints = false
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        divider.translatesAutoresizingMaskIntoConstraints = false
//        answerFieldLabel.translatesAutoresizingMaskIntoConstraints = false
//        displayButton.translatesAutoresizingMaskIntoConstraints = false

        
//        view.backgroundColor = UIColor(red: 249, green: 249, blue: 249, alpha: 0.94)
//        view.backgroundColor = .red
                  
        
        initialize()
        
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        divider.translatesAutoresizingMaskIntoConstraints = false
        
    }
        
        private func initialize() {
            displayButton.translatesAutoresizingMaskIntoConstraints = false

            largeLabel.translatesAutoresizingMaskIntoConstraints = false
            mainLabel.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            divider.translatesAutoresizingMaskIntoConstraints = false
            answerFieldLabel.translatesAutoresizingMaskIntoConstraints = false

            
            
            self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
//            self.view.backgroundColor = .red

            
            
            //title for Navigation Controller
            self.title = "Reverse words"
            
            //largeLabel
//            largeLabel.frame = CGRect(x: 16, y: 152, width: 343, height: 41);
            largeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)   // weight from CSS
            largeLabel.textAlignment = .center
            largeLabel.text = "Reverse words"
            
//            self.view.addSubview(largeLabel)
            view.addSubview(largeLabel)

            
            largeLabel.snp.makeConstraints { maker in
                maker.leading.equalTo(view).offset(16)
                maker.trailing.equalTo(view).offset(-16)
                maker.top.equalTo(view).offset(152)
                maker.bottom.equalTo(view).offset(-619)
            }
            
            //mainLabel
//            mainLabel.frame = CGRect(x: 33, y: 209, width: 308, height: 44);
            mainLabel.font = UIFont.systemFont(ofSize: 17)
            mainLabel.textAlignment = .center
            mainLabel.numberOfLines = 2
            mainLabel.text = "This application will reverse your words. Please type text below"
        
            
//            self.view.addSubview(mainLabel)
            view.addSubview(mainLabel)

            
            mainLabel.snp.makeConstraints { maker in
                maker.leading.equalTo(view).offset(33)
                maker.trailing.equalTo(view).offset(-34)
                maker.top.equalTo(largeLabel.snp.bottom).offset(16)
                maker.bottom.equalTo(view).offset(-559)
            }
            
            
            //TextField
            textField.frame = CGRect(x: 16, y: 312, width: 343, height: 22)   // 312 правильное расстояние
            textField.font = UIFont.systemFont(ofSize: 17)
            textField.text = nil
            textField.placeholder = "Text to reverse"
            
//            self.view.addSubview(textField)
                        self.view.addSubview(textField)

            
            textField.snp.makeConstraints { maker in
                maker.leading.equalTo(view).offset(16)
                maker.trailing.equalTo(view).offset(-16)
                maker.top.equalTo(mainLabel.snp.bottom).offset(59)
//                maker.bottom.equalTo(view).offset(497)
            }
            
//
            //divider
            self.divider.frame = CGRect(x: 16, y: 352.5, width: 343, height: 0.5)  //16  352.5
            self.divider.backgroundColor = UIColor(red: 34, green: 34, blue: 34, alpha: 1)
//            divider.translatesAutoresizingMaskIntoConstraints = false


            self.view.addSubview(divider)
//            view.addSubview(divider)
//
//            divider.snp.makeConstraints { maker in
//                maker.leading.equalTo(view).offset(16)
//                maker.trailing.equalTo(view).offset(-16)
//
//                maker.top.equalTo(view).offset(352.5)
//                или
//                maker.top.equalTo(textField.snp.bottom).offset(18.5)
//                или
//                maker.bottom.equalTo(view).offset(459.5)
//            }


            
            //answerField
            self.answerFieldLabel.isHidden = false
//            self.answerFieldLabel.frame = CGRect(x: 16, y: 377, width: 198, height: 22)
            self.answerFieldLabel.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            self.answerFieldLabel.textColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1) //in figma #007AFF
            self.answerFieldLabel.font = UIFont.systemFont(ofSize: 24)
            self.answerFieldLabel.textAlignment = .left
            self.answerFieldLabel.numberOfLines = 0
            self.answerFieldLabel.isHidden = true
            
//            self.view.addSubview(answerFieldLabel)
            view.addSubview(answerFieldLabel)

            
            answerFieldLabel.snp.makeConstraints { maker in
                maker.leading.equalTo(view).offset(13)
                maker.trailing.equalTo(view).offset(-161)
                maker.top.equalTo(view).offset(377)
                maker.bottom.equalTo(view).offset(-413)
            }
            
            
            //displayButton
            self.displayButton = UIButton(type: .system)
            self.displayButton.setTitle("Reverse", for: .normal)
            self.displayButton.setTitleColor(.white, for: .normal)
            self.displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
            self.displayButton.layer.cornerRadius = 14
            self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6)
//            self.displayButton.frame = CGRect(x: 13, y: 686, width: 349, height:60)
            self.displayButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
            
//            self.view.addSubview(displayButton)
            view.addSubview(displayButton)

            
            displayButton.snp.makeConstraints { maker in
                maker.leading.equalTo(view).offset(13)
                maker.trailing.equalTo(view).offset(-13)
                maker.top.equalTo(view).offset(686)
                maker.bottom.equalTo(view).offset(-66)
                
            }
        }
        
        @objc func buttonPressed(sender: UIButton) {
            
            answerFieldLabel.text = textField.text
            
            if displayButton.backgroundColor == UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0) {
                textField.text = " "
                answerFieldLabel.text = " "
                self.displayButton.setTitle("Reverse", for: .normal)
                
            } else {
                //реверсивный механизм reverse mechanism
                let text = textField.text!
                let reversedText = String(text.reversed())
                answerFieldLabel.text = reversedText
                
                //displayButton title changing
                
                self.displayButton.setTitle("Clear", for: .normal)
                self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
                
                answerFieldLabel.isHidden = false
            }
        
    }
}


