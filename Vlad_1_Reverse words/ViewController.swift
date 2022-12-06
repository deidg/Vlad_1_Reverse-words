//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//


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
        //        displayButton.isEnabled = true
        displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
        displayButton.setTitle("Reverse", for: .normal)
        displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        displayButton.layer.cornerRadius = 14
        displayButton.addTarget(ViewController.self, action: #selector(buttonPressed), for: .touchUpInside)
        return displayButton
    }()
    
    var button2: UIButton = {
        let button2 = UIButton()
        button2.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
        button2.frame = CGRect(x: 15, y: 500, width: 300, height: 60)
        button2.setTitle("Button2", for: .normal)
        return button2
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
        
        //button2
        view.addSubview(button2)
        
        
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
    }
    
    //=========================================================================================/
    
    //=========================================================================================/
    
    //=========================================================================================/
    
    //=========================================================================================/
    
    //=========================================================================================/
    
    
    
    private var clearAction = false
    
    
    
    
    private func applyState(_ state: State) {
        func applyInitialState() {
            print("func applyInitialState сработала")
            
            userText.text = ""
            divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1)
            //            displayButton.isEnabled = true  // ?? блокировка тут нужна?
            answerTextView.text = ""
            answerTextView.isHidden = true
            displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255,
                                                    blue: 255/255, alpha: 1) // покраска когда ВВОДЯТ текст?
            displayButton.setTitle("Clear", for: .normal)
            //            self.state = .typing(text: userText.text!)
            //            print("state поменялся на typing")
        }
        
        func applyTypingState(hasEnteredText: Bool) {
            //            print("func applyTypingState сработала")
            
            //            if let text = userText.text,
            //               text.isEmpty {
            //                            displayButton.isEnabled = true
            
            //
            //                // myTextField is not empty here
            //            } else {
            //                answerTextView.text = "Please, enter your text above"
            //            }
        }
        
        
        
        
        
        //            if hasEnteredText {
        //                displayButton.isEnabled = true
        //                displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255,
        //                                                        blue: 255/255, alpha: 0.6)
        //                displayButton.setTitle("Reverse", for: .normal)
        //                answerTextView.isHidden = false
        //                let text = userText.text!  //change text
        //                let reversedText = String(text.reversed())   //change text
        //                answerTextView.text = reversedText   //change text
        //
        //                displayButton.setTitle("Reverse", for: .normal)
        //            } else {
        //                applyInitialState()
        //            }
        
        
        func applyResultState(result: String) {
            
        }
    }
    
    switch state {                                             // переключение экранов
    case .initial:                                         // первый экран
        applyInitialState()                           //функция первого экрана   стр 176
    case .typing(let text):                               // второй экран
        applyTypingState(hasEnteredText: !text.isEmpty)   //функция второго экрана   стр 190
    case .result(let result):                              // третий экран
        applyResultState(result: result)        //функция третьего экрана    стр 212
    default:
        break
     }
    
    
  }

//MARK: extension
extension ViewController: UITextFieldDelegate {    // расширение функций Тексфилда
    
    func textFieldDidBeginEditing (_ textField: UITextField) {
        //                if resignFirstResponder(){
        //                state = .initial
        print("textFieldDidBeginEditing 1")
        //                } else {
        //            func applyInitialState()
        //            self.divider.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
        //        print("textFieldDidBeginEditing after Else work")
    }
    //        }
    func textFieldDidEndEditing(_ textField: UITextField) {
        divider.backgroundColor = UIColor(red: 0.0, green: 122/255, blue: 255/255, alpha: 1.0)
        displayButton.isEnabled = true  // ?? блокировка тут нужна?
        //            state = .typing(text: <#T##String#>)
        
        print("Entering text finished")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {  //override?
        
        //            displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255,
        //                                                    blue: 255/255, alpha: 1)
        //
        view.endEditing(true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {     //override?
        view.endEditing(true)
        //            displayButton.isEnabled = true  // ?? блокировка тут нужна?
    }
}

    //    func isValid(with userText: String) -> Bool {
    //            guard let text = self.userText,
    //                  !text.isEmpty else {
    //                print("Please fill the field.")
    //                return false
    //            }
    //        }
    
    extension ViewController {   // варианты состояний
        enum State {
            case initial                 // первый экран. экран загрузки
            case typing(text: String)    // второй экран. когда набирают текст
            case result(result: String)  // третий экран. результат + подготовка к очистке
        }
    }
//            }
    
    
    //=================================================================================//
    /*
     Экран 1
     
     Загружается экран. +
     Прогружаются заголовки  +
     
     загружается userText c placeholder +
     
     загружается divider - цвет default (серый) +
     
     загружается answerfield пустой, isHidden - true  +
     
     загружается displayButton - слабо голубая, isEnable?????, title Reverse
     
     
     Экран 2
     
     userTextfield:
     текст выводиться. черный. +
     
     divider
     закрашивается в цвет кнопки, если textfield пустой, то цвет серый возвращается
     после того как закончил ввод текста и убрал клаву - цвет снова серый
     answerfield
     выключен (isHidden true)
     displayButton
     цвет насыщенный, is Enable?? (кнопка прожимается при наличии текста, если текста нет - кнопка не прожимается)
     
     
     
     Экран 3
     
     userTextfield
     без изменений
     divider
     серый снова????
     answerfield
     выводиться перевернутый текст.  При этом каждое слово наоборот, а не вся фраза
     цвет текста как кнопки
     если usertext пустой то пустеет и answerfield, при этом ввод текста запрещен
     
     displayButton.     меняется title - Clear
     
     */
    
    //        }
    //    }
    //}
//}
