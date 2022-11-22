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
    var answerFieldLabel = UILabel()
    var displayButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO:  запихнуть всё в функцию как у чувака https://youtu.be/wTL7Ju4-3Kg?t=557
        
        displayButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        
        //title for Navigation Controller
        self.title = "Reverse words"
        
        //largeLabel
        largeLabel.frame = CGRect(x: 16, y: 152, width: 343, height: 41);
        largeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)   // weight from CSS
        largeLabel.textAlignment = .center
        largeLabel.text = "Reverse words"
        
        self.view.addSubview(largeLabel)
        
        largeLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(view).offset(16)
            maker.trailing.equalTo(view).offset(-16)
            maker.top.equalTo(view).offset(152)
            maker.bottom.equalTo(view).offset(-619)
        }
        
        //mainLabel
        mainLabel.frame = CGRect(x: 33, y: 209, width: 308, height: 44);
        mainLabel.font = UIFont.systemFont(ofSize: 17)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        mainLabel.text = "This application will reverse your words. Please type text below"
        
        self.view.addSubview(mainLabel)
        
        mainLabel.snp.makeConstraints { maker in
            maker.leading.equalTo(view).offset(33)
            maker.trailing.equalTo(view).offset(-34)
            maker.top.equalTo(largeLabel.snp.bottom).offset(16)
            maker.bottom.equalTo(view).offset(-559)
        }
        
        
        //TextField
        textField.frame = CGRect(x: 16, y: 312, width: 343, height: 22)
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.text = nil
        textField.placeholder = "Text to reverse"
        
        self.view.addSubview(textField)
        
        //divider
        self.divider.frame = CGRect(x: 16, y: 352.5, width: 343, height: 0.5)
        self.divider.backgroundColor = UIColor(red: 34, green: 34, blue: 34, alpha: 1)
        
        self.view.addSubview(divider)

        
        //answerField
        self.answerFieldLabel.isHidden = false
        self.answerFieldLabel.frame = CGRect(x: 16, y: 377, width: 198, height: 22)
        self.answerFieldLabel.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.answerFieldLabel.textColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1) //in figma #007AFF
        self.answerFieldLabel.font = UIFont.systemFont(ofSize: 24)
        self.answerFieldLabel.textAlignment = .left
        self.answerFieldLabel.numberOfLines = 0
        self.answerFieldLabel.isHidden = true
        
        self.view.addSubview(answerFieldLabel)
        
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
        self.displayButton.frame = CGRect(x: 13, y: 686, width: 349, height:60)
        self.displayButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        self.view.addSubview(displayButton)
        
        displayButton.snp.makeConstraints { maker in
            maker.leading.equalTo(view).offset(13)
            maker.trailing.equalTo(view).offset(-13)
            maker.bottom.equalTo(view).offset(-66)
        }
    }
    
    @objc func buttonPressed(sender: UIButton) {
        
        answerFieldLabel.text = textField.text
        
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


