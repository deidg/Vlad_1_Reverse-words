//
//  Reverser.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 20.12.2022.
//

import Foundation


class Reverser {
    func reverseFunc(textToReverse: String) -> String {
        var str = textToReverse
        str.enumerateSubstrings(in: str.startIndex..., options: .byWords) { _, range, _, _ in
            str.replaceSubrange(range, with: str[range].reversed())
        }
        return str
    }
}
