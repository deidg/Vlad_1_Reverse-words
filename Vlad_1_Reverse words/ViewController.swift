//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
// стр 211- настройить констрейнты для contentVIew
//  включить функцию getStatusBarHeight   стр90  надо ее куда то в начало метода перести.
//   прочитать переписку в тг

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
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return view
    }()
    private let titleLabel: UILabel = {
        let largeLabel = UILabel()
        largeLabel.font = UIFont(name: "Roboto-Bold", size: 34)
        largeLabel.textAlignment = .center
        largeLabel.backgroundColor = .white
        largeLabel.text = "Reverse Words"
        return largeLabel
    }()
    let mainLabel: UILabel = {
        let mainLabel = UILabel()
        mainLabel.font = UIFont(name: "Roboto-Regular", size: 17 )
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 0
        mainLabel.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
        mainLabel.backgroundColor = .white
        mainLabel.text = "This application will reverse your words. Please type text below"
        return mainLabel
    }()
     var userTextField: UITextField = {
        let userTextField = UITextField()
        userTextField.font = UIFont(name: "Roboto-Regular", size: 17 )
        userTextField.backgroundColor = .white
        userTextField.isUserInteractionEnabled = true
        userTextField.placeholder = "Text to reverse"
        return userTextField
    }()
    var divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
        return divider
    }()
    var answerTextView: UITextView = {
        let answerTextView = UITextView()
        answerTextView.textColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
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
        userTextField.delegate = self
        displayButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addTapToHideKeyboard()
        observeKeyboardNotificaton()
    }
    
    func getStatusBarHeight() -> CGFloat {
    var statusBarHeight: CGFloat = 0
    if #available(iOS 13.0, *) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
    }
    return statusBarHeight
}
//var statusBarHeight: CGFloat
//    statusBarHeight  = getStatusBarHeight()
    
    
    
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

    private func defaultConfiguration() {
        self.view.backgroundColor = .white
        
        //title for Navigation Controller
        self.title = "Reverse Words"
    }
    private func applyState(_ state: State) {
        func applyInitialState() {
            answerTextView.text = ""
            userTextField.text = ""
            divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
            displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
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
extension ViewController: UITextFieldDelegate {
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

extension ViewController {
    private func setupItemsOnScrollView() {
        view.addSubview(navigationView)
        navigationView.snp.makeConstraints{ make in
            make.top.equalToSuperview()  //+
            make.leading.trailing.equalToSuperview()//+
//            make.height.equalTo(statusBarHeight)   //+-
        }
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints{ make in
            make.top.equalTo(navigationView.snp.bottom)//+
//            make.leading.trailing.equalToSuperview()
            make.bottom.leading.trailing.equalToSuperview()//+

        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.bottom.top.width.height.equalToSuperview() //+
        }
        //titleLabel   +
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16) //
            make.top.equalToSuperview().inset(152)
        }
        // mainLabel+
        contentView.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(33)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
        }
        //userTextField
        contentView.addSubview(userTextField)
        userTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(mainLabel.snp.bottom).offset(59)
        }
        //divider
        contentView.addSubview(divider)
        divider.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(userTextField.snp.bottom).offset(18.5)
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
   











