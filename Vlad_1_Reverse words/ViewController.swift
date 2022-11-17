//
//  ViewController.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

import UIKit

class ViewController: UIViewController {

    var displayButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        displayButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.title = "Reverse words"
        
//        displayButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true

        // displayButton
        self.displayButton = UIButton(type: .system)
        self.displayButton.setTitle("Reverse", for: .normal)
        self.displayButton.frame.size.width = 349
        self.displayButton.frame.size.height = 60
        self.displayButton.layer.cornerRadius = 14
        self.displayButton.backgroundColor = UIColor(red: 0.0, green: 122.0, blue: 255.0, alpha: 1.0)


//        self.displayButton.bottomAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutYAxisAnchor>#>)

        
//        displayButton.frame = CGRect.init(x: self.view.frame.width/3.5, y: self.view.frame.height/2,
//                                          width: 349, height: 60)
//        self.displayButton.sizeToFit()
//        self.displayButton.center = self.view.center //расположение кнопки по центру.
//        self.displayButton.size

        
//        Int(screenSize.width - 60)
//        displayButton.frame = CGRect(x: 150, y: 300, width: 349, height: 60)
//        displayButton.widthAnchor.constraint(equalToConstant: 44).isActive = true

                                      
        
        self.view.addSubview(self.displayButton)
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
////            NSLayoutConstraint(item: displayButton,
////                               attribute: .leading,
////                               relatedBy: .equal,
////                               toItem: view,
////                               attribute: .leadingMargin,
////                               multiplier: 1,
////                               constant: 0).isActive = true
//        }
        
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

    



