//
//  bull.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 31.12.2022.
//

import Foundation


class ViewController: UIViewController {
    private(set) var volume = 0 // громкость
    func setVolume(value: Int) {
        volume = min(max(value, 0), 100) } }

//
func characterCompare(stringOne: String, stringTwo: String) -> Bool {
    return Set(stringOne) == Set(stringTwo)
}
