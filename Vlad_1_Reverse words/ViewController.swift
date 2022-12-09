//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//   смог сделать чтобы зеркалился текст, стирался, но при этом не могу залочить кнопки(можно гонять кнопку)



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
        //        answerTextView.textColor = .red
        //        answerTextView.backgroundColor = .red
        answerTextView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        //        answerTextView.text = "fdg"
        answerTextView.font = UIFont.systemFont(ofSize: 20)
        answerTextView.textAlignment = .left
//        answerTextView.isHidden = true
        return answerTextView
    }()
    
    var displayButton: UIButton = { // 6
        let displayButton = UIButton()
//                displayButton.isEnabled = true
        displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
        displayButton.setTitle("Reverse", for: .normal)
        displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        displayButton.layer.cornerRadius = 14
//        displayButton.addTarget(ViewController.self, action: #selector(buttonPressed), for: .touchUpInside)
        displayButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

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
        
//        let buttonPressedString = String()
//        applyTypingState()
        if flag == false && userText.text == "" {
            answerTextView.isHidden = false
            answerTextView.isEditable = false
            answerTextView.textColor = .red
            answerTextView.text = "Enter yout text above"
            displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
//            userText.placeholder = "Enter your text here"
        } else {
            state = .typing
            displayButton.isEnabled = true

        }
//        state = .result   -не работает - сразу кидает на 3й экран

        print("Button pressed str 108")
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
            make.height.equalTo(5)
        }
        
        //answerTextView
        view.addSubview(answerTextView) //7
//        answerTextView.snp.makeConstraints { make in
//            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
//            make.top.equalTo(divider.snp.bottom).offset(24.5)
////            make.bottom.equalToSuperview().offset(-366)
//        }
        
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
    private var flag =  false
//    private var userTextEditable = false
    
//    private var displayButtonChangeColor(touchesEnded) {
//        displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
//    }
    
    
    
    
    private func applyState(_ state: State) {
        func applyInitialState() {
            
//            guard userText.text?.isEmpty
//
//            if clearAction == false && flag == false
//            if userText.text == "" && clearAction == true
//                {
////                self.state = .result
//                              displayButton.isEnabled = true
//                              userText.text = "Enter your text here"
//                              print("here")
//            } else {
print("func 1 applyInitialState сработала")
                answerTextView.isHidden = true
                answerTextView.isEditable = false
                displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                displayButton.setTitle("Reverse", for: .normal)
                userText.isUserInteractionEnabled = true
//                state = .typing
                }
//        }
         
        func applyTypingState() {  //applyTypingState(hasEnteredText: Bool)
            //                        state = .typing
            
            if clearAction == false {
                print("включился 2 applyTypingState")
                answerTextView.isHidden = false
                answerTextView.isEditable = false
                answerTextView.textColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                userText.isUserInteractionEnabled = false
                //            answerTextView.backgroundColor = .red
                displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                let text = userText.text!
                let reversedText = String(text.reversed())
                answerTextView.text = reversedText
                print(reversedText)
                
                
                displayButton.setTitle("Clear", for: .normal)
//
                clearAction = true
//            self.state = .result

        } else {
            print("ты пришёл сюда")
            self.state = .result
//            clearAction = true
        }
        }
        
        func applyResultState() { //applyResultState(result: String)
            print("включился 3 applyResultState 203")
            answerTextView.isHidden = true
            userText.text = ""
            answerTextView.text = ""
            self.displayButton.setTitle("Reverse", for: .normal)
            
            displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            
            print("дошел до 255 строки")
                // почему то не срабатывает смена цвета
//            clearAction = true
            clearAction = false
            displayButton.isEnabled = false
//            flag =  true
            
            self.state = .initial
        }
        
        
        
        
        
        
         switch state {                                             // переключение экранов
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
extension ViewController: UITextFieldDelegate {    // расширение функций Тексфилда
    
    func textFieldDidBeginEditing (_ textField: UITextField) {
        print("textFieldDidBeginEditing 1")
        state = .initial
        print(".initial сработал")
        divider.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        return
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Entering text finished")
        divider.backgroundColor = UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.2)
//        displayButton.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.6)
        
        //            state = .typing
        return
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    //включение клавиатуры
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //выключение клавиатуры
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
    
    
    
    extension ViewController {   // варианты состояний
        enum State {
            case initial                 // первый экран. экран загрузки
            //            case typing(text: String)    //  text - текст юзера? второй экран. когда набирают текст
//            case typing(reversedText: String)    //  text - текст юзера? второй экран. когда набирают текст
            case typing    //  text - текст юзера? второй экран. когда набирают текст
            
//            case result(result: String)  // третий экран. результат + подготовка к очистке
            case result
        }
    }
    
   
