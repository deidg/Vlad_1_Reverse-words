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
    
    //MARK: UI Elements
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 249/255, green: 249/255,blue: 249/255, alpha: 0.94)
        return view
    }()
    private let largeLabel: UILabel = {
        let largeLabel = UILabel()
        largeLabel.font = UIFont(name: "Roboto-Bold", size: 34)
        largeLabel.textAlignment = .center
        largeLabel.text = "Reverse words"
        return largeLabel
    }()
    let mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont(name: "Roboto-Regular", size: 17 )
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        mainLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        mainLabel.text = "This application will reverse your words. Please type text below"
        return mainLabel
    }()
    public var userText: UITextField = {
        let userText = UITextField()
        userText.font = UIFont(name: "Roboto-Regular", size: 17 )
        userText.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        userText.placeholder = "Text to reverse"
        userText.isUserInteractionEnabled = true
        userText.returnKeyType = .continue
        return userText
    }()
    var divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
        return divider
    }()
    var answerTextView: UITextView = {
        let answerTextView = UITextView()
        answerTextView.textColor = UIColor(red: 0, green: 122/255, blue: 255/255, alpha: 1)
        //        answerTextView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        answerTextView.backgroundColor = .green
        
        answerTextView.font = UIFont(name: "Roboto-Regular", size: 20 )
        answerTextView.textAlignment = .left
        answerTextView.isEditable = false
        return answerTextView
    }()
    var displayButton: UIButton = { // 6
        let displayButton = UIButton()
        displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
        displayButton.setTitle("Reverse", for: .normal)
        displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        displayButton.layer.cornerRadius = 14
        return displayButton
    }()
    //setup Roboto font
    let customFont = UIFont(name: "Roboto-Regular", size: UIFont.labelFontSize ) ?? UIFont.systemFont(ofSize: 64)
    
    let reverser =  Reverser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnScrollView()
        defaultConfiguration()
        
        displayButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        addTapToHideKeyboard()
    }
    
    @objc func buttonPressed(sender: UIButton) {
        
        func reverseText(text: String) {
//            print("displayButton pressed")
//            let result = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur non dignissim odio. Donec turpis turpis, laoreet quis risus pulvinar, vestibulum pellentesque enim. Nulla a aliquam enim. Quisque scelerisque nulla quis felis aliquet luctus. Pellentesque vehicula mattis ligula, ut sollicitudin odio consequat eu."
            reverser.reverseFunc(textToReverse: userText)
            
            
            state = .result(result: result)
        }
        func clear() {
            state = .initial
        }
        switch state {
        case .initial:
            break
        case .typing(let text):
            reverseText(text: text)
        case .result:
            clear()
        }
    }
    
    private func defaultConfiguration() {
//        userText.delegate = self
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        
        //title for Navigation Controller
        self.title = "Reverse words"
    }
    private func applyState(_ state: State) {
        func applyInitialState() {
            answerTextView.text = ""
            userText.text = ""
            displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            displayButton.setTitle("Reverse", for: .normal)
            displayButton.isEnabled = false
        }
        func applyTypingText(hasEnteredText: Bool) {
            if hasEnteredText {
                displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                displayButton.isEnabled = true
                displayButton.setTitle("Reverse", for: .normal)
            } else {
                applyInitialState()
            }
        }
        func applyResultState(result: String) {
            answerTextView.text = result
            displayButton.setTitle("Clear", for: .normal)
        }
        
        switch state {
        case .initial:
            applyInitialState()
        case .typing(let text):
            applyTypingText(hasEnteredText: !text.isEmpty)
        case .result(let result):
            applyResultState(result: result)
        }
    }
}

//MARK: extension

//extension ViewController: UITextFieldDelegate {
    
    
    
    
    
    
//    func textFieldDidBeginEditing (_ textField: UITextField) {
//        divider.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
//        displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
//        return
//    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
//        return
//    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        let result = reverser.reverseFunc(textToReverse: textField.text ?? "")
//        view.endEditing(true)
//        state = .result(result: result)
//        return true
//    }
//}

extension ViewController {
    private func setupItemsOnScrollView() {
        view.addSubview(navigationView)
        navigationView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.width.equalTo(375) //400
            make.height.equalTo(88)
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{ make in
            make.edges.width.height.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.width.height.equalToSuperview()
        }
        //largeLabel
        contentView.addSubview(largeLabel)
        largeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16) //
            make.top.equalToSuperview().inset(152)
        }
        // mainLabel
        contentView.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(33)
            make.top.equalTo(largeLabel.snp.bottom).offset(16)
        }
        //userTextField
        contentView.addSubview(userText)
        userText.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(mainLabel.snp.bottom).offset(59)
        }
        //divider
        contentView.addSubview(divider)
        divider.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(userText.snp.bottom).offset(18.5)
            make.height.equalTo(1)
        }
        //answerTextView
        contentView.addSubview(answerTextView)
        answerTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(divider.snp.bottom).offset(16)
        }
        //displayButton
        contentView.addSubview(displayButton)
        displayButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(60)
            make.top.equalTo(answerTextView.snp.bottom).offset(20)
            make.bottom.equalToSuperview().offset(-66)
        }
    }
    enum State {
        case initial
        case typing(text: String)
        case result(result: String)
    }
    
        //MARK: регулировка экрана при появлении клавиатуры
        private func addTapToHideKeyboard() {
            let tap = UITapGestureRecognizer(
                target: self,
                action: #selector(hideKeyboard(gesture:))
            )
            contentView.addGestureRecognizer(tap) //
//            scrollView.addGestureRecognizer(tap) //

        }

        private func observeKeyboardNotificaton() {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(keyboardWillShow(sender:)),
                                                   name: UIResponder.keyboardWillShowNotification,
                                                   object: nil)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(keyboardWillHide(sender:)),
                                                   name: UIResponder.keyboardWillHideNotification,
                                                   object: nil)
        }

        @objc private func keyboardWillShow(sender: NSNotification) {
            guard let userInfo = sender.userInfo else { return }
            guard var keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            var contentInset: UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height
            scrollView.contentInset = contentInset
        }

        @objc private func keyboardWillHide(sender: NSNotification) {
            let contentInset: UIEdgeInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInset
        }

        @objc private func hideKeyboard(gesture: UITapGestureRecognizer) {
            view.endEditing(true)
        }
    }
   










