//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

//TODO: сделать новую ветку и начать проверять логику приложения

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
    var userText: UITextField = { //4
        let userText = UITextField()
        userText.font = UIFont.systemFont(ofSize: 17)
        userText.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        userText.placeholder = "Text to reverse"
        return userText
    }()
    
    var divider: UIView = { //5
        let divider = UIView()
//        divider.frame = CGRect(x: 16, y: 352.5, width: 343, height: 1)  //16  352.
        divider.backgroundColor = UIColor(red: 0/255, green: 100/255, blue: 200/255, alpha: 1)  // отрегулировать цвет
        return divider
    }()
    
    var answerTextView: UITextView = { // 7 - поле с ответом
        let answerTextView = UITextView()
        answerTextView.frame = CGRect(x: 15, y: 378, width: 198, height: 22)

        answerTextView.backgroundColor = UIColor.red
//        answerTextView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        answerTextView.textColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        answerTextView.font = UIFont.systemFont(ofSize: 24)
        answerTextView.textAlignment = .left
//        !!! перенести его вниз в функцию (на выполнение)
        answerTextView.isHidden = true
//        answerTextView.isHidden = false
        return answerTextView
    }()
    
    var displayButton: UIButton = { // 6
        var displayButton = UIButton()
        
        displayButton = UIButton(type: .system)
        displayButton.setTitle("Reverse", for: .normal)
        displayButton.setTitleColor(.white, for: .normal)
        displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        displayButton.layer.cornerRadius = 14
        displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6)
        var displayButtonHeight = 60
        displayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return displayButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultConfiguration()
        setupUI()
        //reverseTextField
        userText.delegate = self
        

    }
    
    @objc func buttonAction(sender: UIButton!) {
      print("Button tapped")
    }
    
    
    
    //@objc func buttonPressed(_ sender: UIButton) {
    //     print("button was pressed")
    //}

    
    
    
    private func setupUI() {
        // Title label
        
        //largeLabel
        view.addSubview(largeLabel)  //2
        largeLabel.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.top.equalTo(view).offset(152)
//            make.bottom.equalTo(view).offset(-619)
        }
        // mainLabel
        view.addSubview(mainLabel)  //3
        mainLabel.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(33)
            make.trailing.equalTo(view).offset(-34)
            make.top.equalTo(largeLabel.snp.bottom).offset(16)
//            make.bottom.equalTo(view).offset(-559)
        }
        //userTextField
        view.addSubview(userText) //4
        userText.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
            make.top.equalTo(mainLabel.snp.bottom).offset(59)
            // make.bottom.equalTo(view).offset(-559)
        }
        //TODO: constraints
        
//        divider
        view.addSubview(divider)  //5
//        divider.snp.makeConstraints { make in
//            make.leading.equalTo(view).offset(16)
//            make.trailing.equalTo(view).offset(-16)
//            make.top.equalTo(userText.snp.bottom).offset(18.5)// либо констрейнт либо координаты.
//        }
        
        //answerField
        view.addSubview(answerTextView)   //7
//        answerTextView.snp.makeConstraints { maker in
//            maker.top.equalTo(view).offset(403)  //  перепривязать к верху или к нижней кнопке?
//            maker.leading.equalToSuperview().offset(13)
//            maker.trailing.equalTo(view).offset(-161)
            
//            maker.top.equalTo(divider.snp.bottom).offset(24)

//            maker.bottom.equalTo(view).offset(-403)  //  перепривязать к верху или к нижней кнопке?
//        }
        
        //displayButton
        view.addSubview(displayButton)  //6
        displayButton.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(13)
            maker.trailing.equalTo(view).offset(-13)
//            maker.height.equalTo(displayButtonHeight)
            maker.bottom.equalTo(view).offset(-66)
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
        
        //MARK: - userText
//        userText.frame = CGRect(x: 16, y: 310, width: 343, height: 22)   // 312
//        userText.frame = CGRect(x: 0, y: 0, width: 343, height: 22)   // 312

        
        //MARK: - divider
//        self.divider.frame = CGRect(x: 16, y: 352.5, width: 343, height: 0.5)  //16  352.
        divider.frame = CGRect(x: 16, y: 352.5, width: 343, height: 1)  //16  352.

        
        //MARK: - answerField
        
        
        //MARK: - displayButton
        
    }
    
    private func applyState(_ state: State) {
        func applyInitialState() {
//            answerTextView.isHidden = true
            displayButton.isEnabled = false // работает???
            displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6)
        }
        func applyTypingState(hasEnteredText: Bool) {
            if hasEnteredText {   // вставить проверку текста
                print("apply typing")
                displayButton.isEnabled = true
                displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1)
            } else {
                applyInitialState()
            }
        }
        func applyResultState(result: String) {
            //add property for result state
            print("text changed")
            
//            answerTextView.isHidden = false

            let text = userText.text!
            let reversedText = String(text.reversed())
            answerTextView.text = reversedText
            displayButton.setTitle("Clear", for: .normal)
//                    answerTextView.isHidden = false

            displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.6)
        }
        
        
        
        
        
        switch state {
        case .initial:
            applyInitialState()
        case .typing(let text):
            applyTypingState(hasEnteredText: !text.isEmpty)
        case .result(let result):
            //            applyResultState(result: result) -  правильная
            applyResultState(result: result)
        }
    }
}
//}

//MARK: extension
extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing (_ textField: UITextField) {
        self.divider.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
        displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1)
//        answerTextView.isHidden = false

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



    



//         if displayButton.backgroundColor == UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0) {
//             myText.text = " "
//             answerFieldLabel.text = " "
//             self.displayButton.setTitle("Reverse", for: .normal)
//             self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 0.9)
//
//
//         } else {
//             //реверсивный механизм reverse mechanism
//             let text = myText.text!
//             let reversedText = String(text.reversed())
//             answerFieldLabel.text = reversedText


