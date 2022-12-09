//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.

import UIKit
import SnapKit
import Foundation



class ViewController: UIViewController  {
    
    private var state: State = .initial {
        didSet {
            applyState(state)
        }
    }
    
    let navigationView = UIView() //1
    private let largeLabel: UILabel = {  //2
        let largeLabel = UILabel()
        largeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        largeLabel.textAlignment = .center
        largeLabel.text = "Reverse words"
        return largeLabel
    }()
    let mainLabel: UILabel = {  //3
        let mainLabel = UILabel()
        mainLabel.font = UIFont.systemFont(ofSize: 17)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        mainLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        mainLabel.text = "This application will reverse your words. Please type text below"
        return mainLabel
    }()
    var userText: UITextField = { //4
        let userText = UITextField()
        userText.font = UIFont.systemFont(ofSize: 17)
        userText.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        userText.placeholder = "Text to reverse"
        userText.isUserInteractionEnabled = true
        return userText
    }()
    
    var divider: UIView = {  //5
        let divider = UIView()
        divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
        return divider
    }()
    
    var answerTextView: UITextView = { // 7 - поле с ответом
        let answerTextView = UITextView()
        answerTextView.frame = CGRect(x: 15, y: 378, width: 198, height: 30)
        answerTextView.textColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        answerTextView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        answerTextView.font = UIFont.systemFont(ofSize: 20)
        answerTextView.textAlignment = .left
        return answerTextView
    }()
    
    var displayButton: UIButton = { // 6
        let displayButton = UIButton()
        displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
        displayButton.setTitle("Reverse", for: .normal)
        displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        displayButton.layer.cornerRadius = 14
        displayButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return displayButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultConfiguration()
        setupUI()
        userText.delegate = self
    }
    
    
    @objc func buttonPressed(sender: UIButton!) -> Bool {
        
        if flag == false && userText.text == "" {
            answerTextView.isHidden = false
            answerTextView.isEditable = false
            answerTextView.textColor = .red
            answerTextView.text = "Enter your text above"
            displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
        } else {
            state = .typing
            displayButton.isEnabled = true
        }
        return true
    }
    
    private func setupUI() {
        
        //largeLabel
        view.addSubview(largeLabel)  //2
        largeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalToSuperview().offset(152)  // привщяат к safe area - выоста статус бара
        }
        // mainLabel
        view.addSubview(mainLabel)  //3
        mainLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(33)
            make.top.equalTo(largeLabel.snp.bottom).offset(16)
        }
        //userTextField
        view.addSubview(userText) //4
        userText.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(mainLabel.snp.bottom).offset(59)
        }
        
        //        divider
        view.addSubview(divider)  //5
        divider.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(userText.snp.bottom).offset(18.5)
            make.height.equalTo(5)
        }
        
        //answerTextView
        view.addSubview(answerTextView) //7
        
        //displayButton
        view.addSubview(displayButton)  //6
        displayButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-66)
        }
    }
    
    private func defaultConfiguration() {
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        //MARK: navigationView
        navigationView.frame = CGRect(x: 0, y: 0, width: 400, height: 88)
        navigationView.backgroundColor = UIColor(red: 249/255, green: 249/255,blue: 249/255, alpha: 0.94)
        view.addSubview(navigationView)
        //title for Navigation Controller
        self.title = "Reverse words"
    }
    
    private var clearAction = false
    private var flag =  false // one more flag
    
    private func applyState(_ state: State) {
        func applyInitialState() {
            answerTextView.isHidden = true
            answerTextView.isEditable = false
            displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            displayButton.setTitle("Reverse", for: .normal)
            userText.isUserInteractionEnabled = true
        }
        
        func applyTypingState() {  //applyTypingState(hasEnteredText: Bool)
            if clearAction == false {
                answerTextView.isHidden = false
                answerTextView.isEditable = false
                answerTextView.textColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                userText.isUserInteractionEnabled = false
                displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                let text = userText.text!
                let reversedText = String(text.reversed())
                answerTextView.text = reversedText
                print(reversedText)
                displayButton.setTitle("Clear", for: .normal)
                clearAction = true
            } else {
                self.state = .result
            }
        }
        
        func applyResultState() { //applyResultState(result: String)
            answerTextView.isHidden = true
            userText.text = ""
            answerTextView.text = ""
            self.displayButton.setTitle("Reverse", for: .normal)
            displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            clearAction = false
            displayButton.isEnabled = false
            
            self.state = .initial
        }
        
        switch state {
        case .initial:
            applyInitialState()
        case .typing:
            applyTypingState()
        case .result:
            applyResultState()
        }
    }
}

//MARK: extension
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing (_ textField: UITextField) {
        state = .initial
        divider.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        return
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
        return
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension ViewController {
    enum State {
        case initial
        case typing
        case result
    }
}


