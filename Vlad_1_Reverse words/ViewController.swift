//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController  { //UITextFieldDelegate
    
    
    let navigationView = UIView() //1
    let largeLabel = UILabel() //2
    let mainLabel = UILabel() //3
    //    var myTextView = UITextView()
    var myText = UITextField() //4
    
    //    let divider = UILabel()
    let divider = UIView()  //5
    
    //    var answerFieldLabel = UILabel()
    var answerFieldLabel = UITextView()  // 7 - поле с ответом
    
    
    var displayButton = UIButton()  // 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //        myText.delegate = self
        
        //     view.backgroundColor = .red
        
        //        var placeholder = "Text to reverse"
        
        initialize()
        
        
        
        
    }
    
    //    override func viewSafeAreaInsetsDidChange() {
    //            super.viewSafeAreaInsetsDidChange()
    //            self.tableView.contentInset = UIEdgeInsets(top: self.tableView.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
    //        }
    
    
    
    private func initialize() {
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        //MARK: navigationView
        
        
        navigationView.frame = CGRect(x: 0, y: 0, width: 400, height: 88)
        //            navigationView.backgroundColor = .white
        navigationView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.94)
        
        view.addSubview(navigationView)
        
        
        //title for Navigation Controller
        self.title = "Reverse words"
        
        //MARK: - largeLabel
        largeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)   // weight from CSS
        largeLabel.textAlignment = .center
        largeLabel.text = "Reverse words"
        
        view.addSubview(largeLabel)
        
        
        largeLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(view).offset(16)
            maker.trailing.equalTo(view).offset(-16)
            maker.top.equalTo(view).offset(152)
            maker.bottom.equalTo(view).offset(-619)
        }
        
        //MARK: - mainLabel
        mainLabel.font = UIFont.systemFont(ofSize: 17)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        mainLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        
        mainLabel.text = "This application will reverse your words. Please type text below"
        
        view.addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(view).offset(33)
            maker.trailing.equalTo(view).offset(-34)
            maker.top.equalTo(largeLabel.snp.bottom).offset(16)
            maker.bottom.equalTo(view).offset(-559)
        }
        
        //MARK: - myText
        
        myText.placeholder = "Text to reverse"
        
        
        //            var placeholder = "Text to reverse"
        //            myText.text = placeholder
        //            myText.textColor = UIColor.lightGray
        //
        myText.frame = CGRect(x: 16, y: 310, width: 343, height: 22)   // 312
        
        // размер шрифта???
        myText.font = UIFont.systemFont(ofSize: 17)
        myText.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        //
        
        view.addSubview(myText)
        
       
        
        //            myTextView.snp.makeConstraints { maker in
        //                maker.leading.equalTo(view).offset(16)
        //                maker.trailing.equalTo(view).offset(-16)
        ////                maker.top.equalTo(mainLabel.snp.bottom).offset(59)
        //                maker.bottom.equalTo(view).offset(-497)
        //            }
        
        
        //MARK: - divider
        self.divider.frame = CGRect(x: 16, y: 352.5, width: 343, height: 0.5)  //16  352.5
        self.divider.backgroundColor = UIColor(red: 34, green: 34, blue: 34, alpha: 1)
//                    self.divider.backgroundColor = .red
        
        self.view.addSubview(divider)
        
//
        
            
        //            func dividerChangeColor() {
        //                if myText == " " {
        //                    divider.backgroundColor = .red
        //                } else { nil }
        //
        //            }
        //
        
        //            divider.snp.makeConstraints { maker in
        //                  maker.leading.equalTo(view).offset(16)
        //                  maker.trailing.equalTo(view).offset(-16)
        //                       maker.top.equalTo(myTextView.snp.bottom).offset(59)
        ////                  maker.bottom.equalTo(view).offset(-497)
        //                       }
        //            func dividerChangeColor() {
        //                if textFieldShouldClear.isEmpty == true {
        //                    self.divider.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
        //                } else { error }
        //            }
        
        
        
        //MARK: - answerField
        self.answerFieldLabel.isHidden = false
        self.answerFieldLabel.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.answerFieldLabel.textColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1) //in figma #007AFF
        self.answerFieldLabel.font = UIFont.systemFont(ofSize: 24)
        self.answerFieldLabel.textAlignment = .left
        //            self.answerFieldLabel.numberOfLines = 0
        self.answerFieldLabel.isHidden = true
        
        view.addSubview(answerFieldLabel)
        
        
        answerFieldLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(view).offset(13)
            maker.trailing.equalTo(view).offset(-161)
            maker.top.equalTo(view).offset(377)
            maker.bottom.equalTo(view).offset(-413)
        }
        
        
        //MARK: - displayButton
        self.displayButton = UIButton(type: .system)
        self.displayButton.setTitle("Reverse", for: .normal)
        self.displayButton.setTitleColor(.white, for: .normal)
        self.displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.displayButton.layer.cornerRadius = 14
        self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6) //стартовый цвет
        self.displayButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        view.addSubview(displayButton)
        
        
        displayButton.snp.makeConstraints { maker in
            maker.leading.equalTo(view).offset(13)
            maker.trailing.equalTo(view).offset(-13)
            //                maker.top.equalTo(view).offset(686)
            maker.bottom.equalTo(view).offset(-66)
            
        }
    }
    
    @objc func buttonPressed(sender: UIButton) {
        
        answerFieldLabel.text = myText.text
        
        if displayButton.backgroundColor == UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0) {
            myText.text = " "
            answerFieldLabel.text = " "
            self.displayButton.setTitle("Reverse", for: .normal)
            self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.9)
            
            
        } else {
            //реверсивный механизм reverse mechanism
            let text = myText.text!
            let reversedText = String(text.reversed())
            answerFieldLabel.text = reversedText
            
            //displayButton title changing
            
            self.displayButton.setTitle("Clear", for: .normal)
            self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
            answerFieldLabel.isHidden = false
            
        }
        
    }
}
        
//        func textFieldDidBeginEditing(_ textField: UITextField) {
//               let keyboardToolbar = UIToolbar()
//               keyboardToolbar.sizeToFit()
//               textField.inputAccessoryView = keyboardToolbar
//
//
    
    //MARK: extension
    
extension ViewController: UITextFieldDelegate {

     func textFieldDidBeginEditing (_ textField: UITextField) {
        self.divider.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
    }
}




//        or
//            let dividerActivated = UIView()
//            dividerActivated.backgroundColor = .red
//            divider.backgroundColor = dividerActivated.backgroundColor
            
            //            let dividerActive = UIView()
            //            dividerActive.backgroundColor = UIColor(red: 0, green: 100, blue: 200, alpha: 1)
            //            divider.backgroundColor = dividerActive.backgroundColor
            
            
//            print("message")
//        }
//    }
    //
    //    func textFieldShouldClear(_ textField: UITextField) -> Bool {
    //        myText.clearsOnBeginEditing = true
    //
    //        //        divider.backgroundColor = .red
    //        return true
    //    }
    
    
//    extension ViewController: UITextFieldDelegate {
//
//
//        }
//    }
//}




        //extension  UITextField: UITextFieldDelegate {
        //
        //    if var clearsOnBeginEditing = true {
        //        .clearsOnBeginEditing
        //
        //    }
        //
        //    if myText.clearsOnBeginEditing {
        //        myText.clearsOnBeginEditing = true
        //self.divider.backgroundColor = .red
        //
        //    }
        
        
        
        //    myText
        //
        //    clearsOnBeginEditing =
        //
        //    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        //        textFieldShouldClear(YESSTR)
        //    }
        //    var isEditing =
        
        //    textField.textColor = .black
        //    divider.backgroundColor = textField.textColor = .black
        ////    clearsOnBeginEditing
        //}
        
//    }
//}
