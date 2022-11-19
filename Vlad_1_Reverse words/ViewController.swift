//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {

    
    let largeLabel = UILabel()
    let mainLabel = UILabel()
    var textField = UITextField()
    let divider = UILabel()
    var answerFieldLabel = UILabel()
    var displayButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
//        answerField.isHidden = true
    self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            
        displayButton.translatesAutoresizingMaskIntoConstraints = false
                
        //title for Navigation Controller
        self.title = "Reverse words"

        
        //largeLabel
        largeLabel.frame = CGRect(x: 16, y: 152, width: 343, height: 41);
        largeLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)   // weight from CSS
        largeLabel.textAlignment = .center
        largeLabel.text = "Reverse words"

        self.view.addSubview(largeLabel)

        
        //mainLabel
        mainLabel.frame = CGRect(x: 33, y: 209, width: 308, height: 44);
        mainLabel.font = UIFont.systemFont(ofSize: 17)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        mainLabel.text = "This application will reverse your words. Please type text below"
        //mainLabel.textColor = UIColor(red: 60, green: 60, blue: 67, alpha: 1) -  not settled (from CSS code)
        
        self.view.addSubview(mainLabel)
        
        
        //TextField
        textField.frame = CGRect(x: 16, y: 312, width: 343, height: 22)
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.text = nil
        textField.placeholder = "Text to reverse"
        
        self.view.addSubview(textField)
        

        //divider
        self.divider.frame = CGRect(x: 16, y: 352.5, width: 343, height: 0.5)
        self.divider.backgroundColor = UIColor(red: 34, green: 34, blue: 34, alpha: 1)

        self.view.addSubview(divider)


        //answerField
        self.answerFieldLabel.isHidden = false
        self.answerFieldLabel.frame = CGRect(x: 16, y: 377, width: 198, height: 22)
        self.answerFieldLabel.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.answerFieldLabel.textColor = UIColor(red: 0, green: 122, blue: 255, alpha: 1) //in figma #007AFF
        self.answerFieldLabel.font = UIFont.systemFont(ofSize: 24)
        self.answerFieldLabel.textAlignment = .left
        self.answerFieldLabel.numberOfLines = 2
        self.answerFieldLabel.text = "answer"
        
        //реверсивный механизм
//        let text = answerFieldLabel.text!
//        let reversedText = String(text.reversed())
//
//        answerFieldLabel.text = reversedText
        
        self.view.addSubview(answerFieldLabel)

        
        //displayButton
        self.displayButton = UIButton(type: .system)
        self.displayButton.setTitle("Reverse", for: .normal)
        self.displayButton.setTitleColor(.white, for: .normal)
        self.displayButton.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        self.displayButton.layer.cornerRadius = 14
        self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122.0, blue: 255.0, alpha: 1.0)
        self.displayButton.frame = CGRect(x: 13, y: 686, width: 349, height:60);

        self.view.addSubview(self.displayButton)


    
    }

//    func enteringText() {
//
//        ///   посмотреть как передавать значение введеные
//        var context =
//
//        return context
//    }
//
    
    
    func answer() {
//
//        while typing цвет синий
//
                let text = textField.text!
                let reversedText = String(text.reversed())
        
                answerFieldLabel.text = reversedText


        answerFieldLabel.isHidden = false

    }

                
    }
//}

//
//func buttonPressed(_ sender: UIButton) {
//        buttonPressed = Int(sender.title(for: .normal)!)!
//
//
//
//        wolfTurnLabel.text = " Left"
//    }


