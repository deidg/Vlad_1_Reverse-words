//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.


import UIKit
import SnapKit
import Foundation

class mainViewController: UIViewController  {
     var state: State = .initial {
        didSet {
            applyState(state)
        }
    }
    let reverser =  Reverser()
    //MARK: UI Elements
     let scrollView = UIScrollView()
     let contentView = UIView()
     let topView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return view
    }()
     let titleLabel: UILabel = {
        let largeLabel = UILabel()
        largeLabel.font = UIFont(name: "Roboto-Bold", size: 34)
        largeLabel.textAlignment = .center
        largeLabel.backgroundColor = .white
        largeLabel.text = "Reverse Words"
        return largeLabel
    }()
    let themeLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont(name: "Roboto-Regular", size: 17 )
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        mainLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        mainLabel.backgroundColor = .white
        mainLabel.text = "This application will reverse your words. Please type text below"
        return mainLabel
    }()
    let reverseTextField: UITextField = {
        let userTextField = UITextField()
        userTextField.font = UIFont(name: "Roboto-Regular", size: 17 )
        userTextField.backgroundColor = .white
        userTextField.isUserInteractionEnabled = true
        userTextField.placeholder = "Text to reverse"
        return userTextField
    }()
    let divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
        return divider
    }()
    let answerTextView: UITextView = {
        let answerTextView = UITextView()
        answerTextView.textColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        answerTextView.font = UIFont(name: "Roboto-Regular", size: 20 )
        answerTextView.textAlignment = .left
        answerTextView.isEditable = false
        return answerTextView
    }()
    let reverseButton: UIButton = { // 6
        let displayButton = UIButton()
        displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
        displayButton.setTitle("Reverse", for: .normal)
        displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        displayButton.layer.cornerRadius = 14
        return displayButton
    }()
    //setup Roboto font
    let customFont = UIFont(name: "Roboto-Regular", size: UIFont.labelFontSize ) ?? UIFont.systemFont(ofSize: 64)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemsOnScrollView()
        defaultConfiguration()
        reverseTextField.delegate = self
        reverseButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addTapToHideKeyboard()
        observeKeyboardNotificaton()
    }
  
    @objc func buttonPressed(sender: UIButton) {
        func reverseText(text: String) {
            let reversedText = reverser.reverseFunc(textToReverse: text)
            state = .result(result: reversedText)
        }
        func clear() {
            state = .initial
        }
        switch state {
        case .initial:
            break
        case .typing(let text): // updated text из делегата уходит func reverseText
            reverseText(text: text)
        case .result:
            clear()
        }
    }

     func defaultConfiguration() {
        self.view.backgroundColor = .white
        
        //title for Navigation Controller
        self.title = "Reverse Words"
    }
     func applyState(_ state: State) {
        func applyInitialState() {
            answerTextView.text = ""
            reverseTextField.text = ""
            divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
            reverseButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
            reverseButton.setTitle("Reverse", for: .normal)
            reverseButton.isEnabled = false
        }
        func applyTypingText(hasEnteredText: Bool) {
            if hasEnteredText {
                reverseButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                reverseButton.isEnabled = true
                reverseButton.setTitle("Reverse", for: .normal)
            } else {
                applyInitialState()
            }
        }
        func applyResultState(result: String) {
            answerTextView.text = result
            reverseButton.setTitle("Clear", for: .normal)
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
extension mainViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing (_ textField: UITextField) {
        return
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        return
    }
    //отслеживает изменение текста в моменте
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            if updatedText == "" {
                state = .initial
            } else {
                divider.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                state = .typing(text: updatedText)
            }
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}

extension mainViewController {
     func setupItemsOnScrollView() {
        //navigationView
        view.addSubview(topView)
        topView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        //scrollView
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        //contentView
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.bottom.top.width.height.equalToSuperview()
        }
        //titleLabel
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16) //
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(64)
            make.height.equalTo(41)//
        }
        // mainLabel
        contentView.addSubview(themeLabel)
        themeLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(33)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
        //userTextField
        contentView.addSubview(reverseTextField)
        reverseTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(themeLabel.snp.bottom).offset(59)
        }
        //divider
        contentView.addSubview(divider)
        divider.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(reverseTextField.snp.bottom).offset(18.5)
            make.height.equalTo(1)
        }
        //answerTextView
        contentView.addSubview(answerTextView)
        answerTextView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(divider.snp.bottom).offset(16)
        }
        //displayButton
        contentView.addSubview(reverseButton)
        reverseButton.snp.makeConstraints { make in
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
         func addTapToHideKeyboard() {
            let tap = UITapGestureRecognizer(
                target: self,
                action: #selector(hideKeyboard(gesture:))
            )
            contentView.addGestureRecognizer(tap) //
        }
         func observeKeyboardNotificaton() {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(keyboardWillShow(sender:)),
                                                   name: UIResponder.keyboardWillShowNotification,
                                                   object: nil)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(keyboardWillHide(sender:)),
                                                   name: UIResponder.keyboardWillHideNotification,
                                                   object: nil)
        }

        @objc  func keyboardWillShow(sender: NSNotification) {
            guard let userInfo = sender.userInfo else { return }
            guard var keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }
            keyboardFrame = self.view.convert(keyboardFrame, from: nil)
            var contentInset: UIEdgeInsets = self.scrollView.contentInset
            contentInset.bottom = keyboardFrame.size.height
            scrollView.contentInset = contentInset
        }

        @objc func keyboardWillHide(sender: NSNotification) {
            let contentInset: UIEdgeInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInset
        }
        @objc func hideKeyboard(gesture: UITapGestureRecognizer) {
            view.endEditing(true)
        }
    }
