//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var displayButton = UIButton()
    let mainLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        displayButton.translatesAutoresizingMaskIntoConstraints = false
        
//        let screenSize: CGRect = UIScreen.main.bounds
        
        //title for Navigation Controller
        self.title = "Reverse words"
//        self.title

        
        //mainLabel
        let mainLabel = UILabel()
//        let margins = view.layoutMarginsGuide
        mainLabel.frame = CGRect(x: 140, y: 100, width:150, height:30);
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.text = "Reverse words"

        self.view.addSubview(mainLabel)

//====
        
      //   displayButton
        self.displayButton = UIButton(type: .system)
       
        self.displayButton.setTitle("Reverse", for: .normal)
        self.displayButton.titleLabel?.font = UIFont.init(name: , size: <#T##CGFloat#>)
        
        saveBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)

        
//        self.displayButton.frame.size.width = 349
//        self.displayButton.frame.size.height = 60
//            let margins = displayButton.layoutMarginsGuide
//        displayButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true

        
        self.displayButton.layer.cornerRadius = 14
        self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122.0, blue: 255.0, alpha: 1.0)
        self.displayButton.frame = CGRect(x: 13, y: 686, width: 349, height:60);


//        =====
        

        func createDisplayButtonConstraints() {
        NSLayoutConstraint(item: displayButton,
                                     attribute: .leading,
                                     relatedBy: .equal,
                                     toItem: view,
                                     attribute: .leadingMargin,
                                     multiplier: 1,
                                     constant: 0).isActive = true

            NSLayoutConstraint(item: displayButton,
                                         attribute: .trailingMargin,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .trailingMargin,
                                         multiplier: 1,
                                         constant: 0).isActive = true

            NSLayoutConstraint(item: displayButton,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .topMargin,
                                         multiplier: 1,
                                         constant: 88).isActive = true

            NSLayoutConstraint(item: displayButton,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: view,
                                         attribute: .width,
                                         multiplier: 1,
                                         constant: 0).isActive = true
              }
        
        
        self.view.addSubview(self.displayButton)
        createDisplayButtonConstraints()
        
        
//         func setConstraints() {
//                NSLayoutConstraint.activate([
////                    displayButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//                    displayButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
////                    displayButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//                    displayButton.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: 20),
//                ])
        
        
        
        
        
        
//        self.displayButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10)

        
        
//        addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
//        addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//
//        weatherView.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
//        weatherView.leadingAnchor.constraint(equalTo: addWorkoutButton.trailingAnchor, constant: 5),
//        weatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        

        //===

//        self.displayButton.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)

        
//        displayButton.frame = CGRect.init(x: self.view.frame.width/3.5, y: self.view.frame.height/2,
//                                          width: 349, height: 60)
//        self.displayButton.sizeToFit()
//        self.displayButton.center = self.view.center //расположение кнопки по центру.
//        self.displayButton.size

        
//        Int(screenSize.width - 60)
//        displayButton.frame = CGRect(x: 150, y: 300, width: 349, height: 60)
//        displayButton.widthAnchor.constraint(equalToConstant: 44).isActive = true

                                      
        
//        self.view.addSubview(self.displayButton)
//        self.view.addSubview(self.mainLabel)
        
        
        
        
        
        
//        setupConstraints()
//        createDisplayButtonConstraints()
        
        
        
        
//         func setupConstraints() {
//            displayButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
//        }
//        func createDisplayButtonConstraints() {
//            NSLayoutConstraint.activate([
//                displayButton.leadingAnchor.constraint(equalTo: self.)
//            ])
//
////
        
        //Reverse Button
        
//
//        displayButton.translatesAutoresizingMaskIntoConstraints = false
        
        
//        self.displayButton.layer = self.view.center
        
        
        
//        self.displayButton = UIButton(type: .system)
//        self.displayButton.backgroundColor = .red
        

//        self.displayButton.frame.size.width = 200
//        self.displayButton.frame.size.height = 200
//        self.displayButton.frame = CGRect.init(x: self.view.frame.width/3.5, y: self.view.frame.height/2, width: 180, height: 50)
        
        
        
        
        
        
        //TODO
//        displayButton.layer.borderColor = UIColor.black.cgColor
//        displayButton.layer.borderWidth = 1.5
//        displayButton.layer.cornerRadius = 5
        
        
        
        
//        self.displayButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpOutside)
        
        
        
//        displayButton.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
//
//        @objc func buttonTapped(sender : UIButton) {
//        //Write button action here
//        print(“button clicked”)
        
        
        
    }

    }

    



