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




// инициализация переменных

let imageView = UIImageView()
let nameLabel = UILabel()




import Foundation


//прописывание (регистрация) новой ячейки в новом view controller
https://youtu.be/bZRhrJxxZkM?t=1126

// установка идентификатора (indetifier)
class CollectionTableViewCell: UITableViewCell {
  static let identifier = "CollectionTableViewCell"
  
  ...
}

//инициализация не на прямую, а через инициализатор (init). Заметь что в скобках инита уже стоят значения и его инициалы(булевое значение,  стринг). Пример из ролика про Паттерны проектирования (про Инициаливтор). После 7.00

class Driver {
  let isGoodDriver: Bool
  let name: String
  var age: Int
  
  init(isGood: Bool, name: String) {
      self.isGoodDriver = isGood
      self.name = name
      self.age = 4
  }
}

  //инициализация массива. Пример из ролика про Паттерны проектирования (про Инициаливтор). После 8.00

class Car {
  var goodDriverIterator: GoodDriverIterator {
      return GoodDriverIterator(drivers: drivers)
  }
  
  private let drivers = [Driver(isGood: true, name: "Mark"),
                         Driver(isGood: false, name: "Ivan"),
                         Driver(isGood: true, name: "Maria"),
                         Driver(isGood: false, name: "Morgan")]
}


//инициализация view??? - не проверенный вариант

let image = UIImage(named: imageName)
let imageView = UIImageView(image: image!)
=====

// проверенная инициализация

@IBOutlet weak var myFoto: UIImageView!

myFoto.image = UIImage(named: "velobike")
=====

let mainLabel = UILabel()


//инициализация класса + констрейнт? https://youtu.be/DUdkvZnbQpk?t=780

private let carImage: UIImage = {
  let view = UIImageView()
  view.layer.cornerRadius = 20
  view.layer.masksToBounds = true
  view.translatesAutoresizingMaskIntoConstraints = false   // tamic - сокращение для поиска
  return view
}()   // обрати внимание на () в конце!!!

// инициализация нескольких объектов сразу (через массив)
https://youtu.be/DUdkvZnbQpk?t=1380

простая инициализация https://youtu.be/EhDML-fAqTM?t=168
https://youtu.be/w8mjwvJHc7E?t=278

Мади о нескольких инициализациях сразу, методах (это функция - внутри класса)
https://youtu.be/bMIY4ojoh5g?t=1440
