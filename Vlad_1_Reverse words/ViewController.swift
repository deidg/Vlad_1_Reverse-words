//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

import UIKit
import SnapKit



class ViewController: UIViewController  {
    
    let navigationView = UIView() //1
    let largeLabel = UILabel() //2
    let mainLabel = UILabel() //3
    var myText = UITextField() //4
    let divider = UIView()  //5
    
    var answerTextView = UITextView()  // 7 - поле с ответом
    
    var displayButton = UIButton()  // 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        
        myText.delegate = self
        
    }
    
    private func initialize() {
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        //MARK: navigationView
        
        navigationView.frame = CGRect(x: 0, y: 0, width: 400, height: 88)
        navigationView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.94)
        
        view.addSubview(navigationView)
        
        
        //title for Navigation Controller
        self.title = "Reverse words"
        
        //MARK: - largeLabel
        largeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
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
        myText.frame = CGRect(x: 16, y: 310, width: 343, height: 22)   // 312
        
        myText.font = UIFont.systemFont(ofSize: 17)
        myText.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        view.addSubview(myText)
        
        //MARK: - divider
        self.divider.frame = CGRect(x: 16, y: 352.5, width: 343, height: 0.5)  //16  352.5
        self.divider.backgroundColor = UIColor(red: 34, green: 34, blue: 34, alpha: 1)
        
        self.view.addSubview(divider)
        
        
        //MARK: - answerField
        self.answerTextView.isHidden = false
        self.answerTextView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        self.answerTextView.textColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        self.answerTextView.font = UIFont.systemFont(ofSize: 24)
        self.answerTextView.textAlignment = .left
        self.answerTextView.isHidden = true
        
        view.addSubview(answerTextView)
        
        
        answerTextView.snp.makeConstraints { maker in
            maker.leading.equalTo(view).offset(13)
            maker.trailing.equalTo(view).offset(-161)
            maker.top.equalTo(view).offset(377)
            maker.bottom.equalTo(view).offset(-403)
        }
        
        
        //MARK: - displayButton
        self.displayButton = UIButton(type: .system)
        self.displayButton.setTitle("Reverse", for: .normal)
        self.displayButton.setTitleColor(.white, for: .normal)
        self.displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.displayButton.layer.cornerRadius = 14
        self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6)
        let displayButtonHeight = 60
        view.addSubview(displayButton)
        
        displayButton.snp.makeConstraints { maker in
            maker.leading.equalTo(view).offset(13)
            maker.trailing.equalTo(view).offset(-13)
            maker.height.equalTo(displayButtonHeight)
            maker.bottom.equalTo(view).offset(-66)
            
        }
    }
    
    //MARK: enum
    enum DisplayButtonState {
        case changeState, clearState
    }
    private var state: DisplayButtonState = .changeState
    
    @objc func buttonPressed(sender: UIButton) {
        switch state {
        case .changeState:
            state = .clearState
            let text = myText.text!
            let reversedText = String(text.reversed())
            answerTextView.text = reversedText
            self.displayButton.setTitle("Clear", for: .normal)
            self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
            answerTextView.isHidden = false
        case .clearState:
            myText.text = " "
            answerTextView.text = " "
            self.displayButton.setTitle("Reverse", for: .normal)
            self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6)
        }
    }
}
            
            
//MARK: extension

extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing (_ textField: UITextField) {
        self.divider.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
    }

    internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    internal override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
            
     
