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



// большая статья про функции. Swiftblog
     https://swiftblog.org/funkcii-v-swift/

статья на хабре - https://habr.com/ru/post/244487/

//метод для перезагрузки изображения (при переиспользовании ячейки чтобы не загружалось старое)
override func prepareForReuse() {  //переписываем метод
    super.prepareForReuse()     //обязательно указываем переписываем метод
    self.productImage.image = nil
    
}

    // ставит наблюдателя за данными которые придут от datepicker.  в этом же видео ранее говорит о #selector
https://youtu.be/TNHXtM7bDiY?t=720



//программно замена outlets (их протягиванию) - объявление функций @objc
https://youtu.be/Ime8NK5NLgc?t=258
