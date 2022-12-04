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
        return userText
    }()
    
    var divider: UIView = {  //5
        let divider = UIView()
        divider.backgroundColor = .gray  // выставить нужный цвет
        return divider
    }()
    
    var answerTextView: UITextView = { // 7 - поле с ответом
        let answerTextView = UITextView()
        answerTextView.frame = CGRect(x: 15, y: 378, width: 198, height: 30)
        answerTextView.textColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        answerTextView.font = UIFont.systemFont(ofSize: 20)
        answerTextView.textAlignment = .left
        answerTextView.isHidden = true
        return answerTextView
    }()
    
    var displayButton: UIButton = { // 6
        let displayButton = UIButton()
        
        displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        displayButton.layer.cornerRadius = 14
//        displayButton.addTarget(ViewController.self, action: #selector(buttonPressed), for: .touchUpInside)
        return displayButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultConfiguration()
        setupUI()
        userText.delegate = self
    }
    
    @objc func buttonPressed(sender: UIButton!) -> Bool {

        let buttonPressedString = String()
        state = .result(result: buttonPressedString)
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
            make.height.equalTo(1)
        }
        
        //answerTextView
        view.addSubview(answerTextView) //7
        answerTextView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            make.top.equalTo(divider.snp.bottom).offset(24.5)
        }
        
        //displayButton
        view.addSubview(displayButton)  //6
        displayButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)  //где расположить инициализацию?
            make.bottom.equalToSuperview().offset(-66)
            
//            make.bottom.equalTo(view).offset(-66)

            
//            maker.top.equalTo(divider.snp.bottom).offset(333)
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

        displayButton.backgroundColor = UIColor(red: 200, green: 100, blue: 200, alpha: 1) // поменять потом цвет на нужный
        
    }
    private var clearAction = false
    
    private func applyState(_ state: State) {
        func applyInitialState() {
            print("мы тут")
            userText.text = ""
            divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
            displayButton.isEnabled = false
//            displayButton.backgroundColor = UIColor(red: 200, green: 100, blue: 200, alpha: 1) // поменять потом цвет на нужный
//            displayButton.backgroundColor = .red
            answerTextView.text = ""
            answerTextView.isHidden = true
            displayButton.setTitle("Reverse", for: .normal)
        }
        func applyTypingState(hasEnteredText: Bool) {
            if hasEnteredText {
             
            } else {
                applyInitialState()
            }
        }
        func applyResultState(result: String) {
           
           
            
            
            
            
            
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
        func textFieldDidEndEditing(_ textField: UITextField) {
            divider.backgroundColor = .gray  // выставить нужный цвет
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
            case typing(text: String)
            case result(result: String)
        }
    }



    


