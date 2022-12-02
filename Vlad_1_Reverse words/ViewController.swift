//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

import UIKit
import SnapKit



class ViewController: UIViewController  {
    
    private var state: State = .initial {
        didSet {
           applyState(state)
        }
    }
    
    
    let navigationView = UIView() //1
    private let largeLabel: UILabel = {  //2
        let largeLabel = UILabel()
//        label.text = "Reverse Button"
        // font, color
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
    var myText: UITextField = { //4
        let userText
        myText.font = UIFont.systemFont(ofSize: 17)
        myText.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        myText.placeholder = "Text to reverse"
        return mainLabel

    }()
    
    myText.frame = CGRect(x: 16, y: 310, width: 343, height: 22)   // 312
    
    
    view.addSubview(myText)
    
    
    
    
    
    //4
    let divider = UIView()  //5
    
    var answerTextView = UITextView()  // 7 - поле с ответом
    
    var displayButton = UIButton()  // 6
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultConfiguration()
        setupUI()
        //reverseTextField
        myText.delegate = self
    }
    
    private func setupUI() {
        // Title label
        
        
        //largeLabel
        view.addSubview(largeLabel)  //2
        largeLabel.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.top.equalTo(view).offset(152)
            make.bottom.equalTo(view).offset(-619)
        }
        // second label
        view.addSubview(mainLabel)  //3
        mainLabel.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(33)
            make.trailing.equalTo(view).offset(-34)
            make.top.equalTo(largeLabel.snp.bottom).offset(16)
            make.bottom.equalTo(view).offset(-559)
        }
        
        
    }
    
    private func defaultConfiguration() {
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        //MARK: navigationView
        navigationView.frame = CGRect(x: 0, y: 0, width: 400, height: 88)
        navigationView.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.94)
        view.addSubview(navigationView)
        //title for Navigation Controller
        self.title = "Reverse words"
        
        //MARK: - largeLabel
        
        
        
        
        //MARK: - mainLabel
        
        
        
        
        //MARK: - myText
        
        
        
        //MARK: - divider
        self.divider.frame = CGRect(x: 16, y: 352.5, width: 343, height: 0.5)  //16  352.5
        self.divider.backgroundColor = UIColor(red: 34, green: 34, blue: 34, alpha: 1)
        
        self.view.addSubview(divider)
        
        divider.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(myText.snp.bottom).offset(18.5)
        }
        
        
        //MARK: - answerField
        self.answerTextView.isHidden = false
        self.answerTextView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        self.answerTextView.textColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        self.answerTextView.font = UIFont.systemFont(ofSize: 24)
        self.answerTextView.textAlignment = .left
        self.answerTextView.isHidden = true
        
        view.addSubview(answerTextView)
        
        
        answerTextView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(13)
            maker.trailing.equalTo(view).offset(-161)
            maker.top.equalTo(divider.snp.bottom).offset(24)
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
            maker.leading.equalToSuperview().offset(13)
            maker.trailing.equalTo(view).offset(-13)
            maker.height.equalTo(displayButtonHeight)
            maker.bottom.equalTo(view).offset(-66)
            
        }
    }
    
    private func applyState(_ state: State) {
        func applyInitialState() {
            answerTextView.isHidden = true
            displayButton.isEnabled = false
            //color button
            
        }
        func applyTypingState(hasEnteredText: Bool) {
            if hasEnteredText {
                print("apply typing")
                
            } else {
                applyInitialState()
            }
        }
        func applyResultState(result: String) {
            //add property for result state
        }
        
        switch state {
        case .initial:
            applyInitialState()
        case .typing(let text):
            applyTypingState(hasEnteredText: !text.isEmpty)
        case .result(let result):
            applyResultState(result: result)
        }
    }
}

//MARK: extension

extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing (_ textField: UITextField) {
        self.divider.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        state = .typing(text: textField.text ?? "")
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
        case typing(text: String)
        case result(result: String)
    }
}
