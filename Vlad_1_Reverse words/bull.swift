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



// включить клаву в Симуляторе
// shift + cmd + K


extension ViewController: UITextFieldDelegate {

    //включение клавиатуры
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
    //выключение клавиатуры
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    }
     скрытие клавиатуры для вызванного объекта (выходишь из textView или поля - и клавиатура закрывается)
       textView.resignFirstResponder(true)
====
// замена кнопки Return(аналог Enter) на другую. Пишется в didLoad
userText.returnKeyType = UIReturnKeyType.done

https://stackoverflow.com/questions/31886720/change-return-button-function-to-done-in-swift-in-uitextview
Тут варианты на какие еще кнопки можно заменить - https://developer.apple.com/documentation/uikit/uireturnkeytype

программирование "новой" кнопки - https://stackoverflow.com/questions/5210098/call-a-method-with-the-return-done-button-of-the-keyboard
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // Tell the keyboard where to go on next / go button.
    if textField == theTextField {
        // do stuff
    }

    return true
}

====
Swiftbook - появление и скрытие клавиатуры. с 13.00б   там же с 15.00 настройка отодвигания содержимого при появлении клавиатуры
https://swiftbook.ru/content/21-video-10/

==
2 кнопки по патерну  MVVM https://youtu.be/2ApnvSzf6Xo




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


// swiftlint:disable implicitly_unwrapped_optional
// swiftlint:disable force_unwrapping
class BullsEyeSlowTests: XCTestCase {
  var sut: URLSession!
  let networkMonitor = NetworkMonitor.shared

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = URLSession(configuration: .default)
  }

  override func tearDownWithError() throws {
    sut = nil
    try super.tearDownWithError()
  }

  // Asynchronous test: success fast, failure slow
  func testValidApiCallGetsHTTPStatusCode200() throws {
    try XCTSkipUnless(
      networkMonitor.isReachable,
      "Network connectivity needed for this test.")

    // given
    let urlString = "http://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1"
    let url = URL(string: urlString)!
    // 1
    let promise = expectation(description: "Status code: 200")

    // when
    let dataTask = sut.dataTask(with: url) { _, response, error in
      // then
      if let error = error {
        XCTFail("Error: \(error.localizedDescription)")
        return
      } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
        if statusCode == 200 {
          // 2
          promise.fulfill()
        } else {
          XCTFail("Status code: \(statusCode)")
        }
      }
    }
    dataTask.resume()
    // 3
    wait(for: [promise], timeout: 5)
  }

  // Asynchronous test: faster fail
  func testApiCallCompletes() throws {
    try XCTSkipUnless(
      networkMonitor.isReachable,
      "Network connectivity needed for this test."
    )

    // given
    let urlString = "http://www.randomnumberapi.com/api/v1.0/random?min=0&max=100&count=1"
    let url = URL(string: urlString)!
    let promise = expectation(description: "Completion handler invoked")
    var statusCode: Int?
    var responseError: Error?

    // when
    let dataTask = sut.dataTask(with: url) { _, response, error in
      statusCode = (response as? HTTPURLResponse)?.statusCode
      responseError = error
      promise.fulfill()
    }
    dataTask.resume()
    wait(for: [promise], timeout: 5)

    // then
    XCTAssertNil(responseError)
    XCTAssertEqual(statusCode, 200)
  }
}

