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

class MockUserDefaults: UserDefaults {
  var gameStyleChanged = 0
  override func set(_ value: Int, forKey defaultName: String) {
    if defaultName == "gameStyle" {
      gameStyleChanged += 1
    }
  }
}

// swiftlint:disable implicitly_unwrapped_optional
class BullsEyeMockTests: XCTestCase {
  var sut: ViewController!
  var mockUserDefaults: MockUserDefaults!

  override func setUpWithError() throws {
    try super.setUpWithError()
    sut = UIStoryboard(name: "Main", bundle: nil)
      .instantiateInitialViewController() as? ViewController
    mockUserDefaults = MockUserDefaults(suiteName: "testing")
    sut.defaults = mockUserDefaults
  }

  override func tearDownWithError() throws {
    sut = nil
    mockUserDefaults = nil
    try super.tearDownWithError()
  }

  func testGameStyleCanBeChanged() {
    // given
    let segmentedControl = UISegmentedControl()

    // when
    XCTAssertEqual(
      mockUserDefaults.gameStyleChanged,
      0,
      "gameStyleChanged should be 0 before sendActions")
    segmentedControl.addTarget(
      sut,
      action: #selector(ViewController.chooseGameStyle(_:)),
      for: .valueChanged)
    segmentedControl.sendActions(for: .valueChanged)

    // then
    XCTAssertEqual(
      mockUserDefaults.gameStyleChanged,
      1,
      "gameStyle user default wasn't changed")
  }
}

class BullsEyeUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    try super.setUpWithError()
    continueAfterFailure = false

    app = XCUIApplication()
    app.launch()
  }

  func testGameStyleSwitch() throws {
    // given
    let slideButton = app.segmentedControls.buttons["Slide"]
    let typeButton = app.segmentedControls.buttons["Type"]
    let slideLabel = app.staticTexts["Get as close as you can to: "]
    let typeLabel = app.staticTexts["Guess where the slider is: "]

    // then
    if slideButton.isSelected {
      XCTAssertTrue(slideLabel.exists)
      XCTAssertFalse(typeLabel.exists)

      typeButton.tap()
      XCTAssertTrue(typeLabel.exists)
      XCTAssertFalse(slideLabel.exists)
    } else if typeButton.isSelected {
      XCTAssertTrue(typeLabel.exists)
      XCTAssertFalse(slideLabel.exists)

      slideButton.tap()
      XCTAssertTrue(slideLabel.exists)
      XCTAssertFalse(typeLabel.exists)
    }
  }
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images: [String] = ["image1","image2","image3"]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        
        for index in 0..<images.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: images[index])
            self.scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(images.count), height: scrollView.frame.size.height)
        scrollView.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var page = scrollView.contentOffset.x/scrollView.frame.size.width
        pageControl.currentPage = Int(page)
    }
}



class ViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = self.view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        setupColors()
        setupViewsConstraints()
    }
}


//MARK: - Setup Views
extension ViewController {
    private func setupViewsConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
        ])
        
        for view in stackView.arrangedSubviews {
            NSLayoutConstraint.activate([
                view.widthAnchor.constraint(equalToConstant: 300),
                view.heightAnchor.constraint(equalToConstant: 100),
            ])
        }
    }
    
    private func setupColors() {
        let colors = [UIColor.red, .green, .blue]
        for index in 0..<10 {
            let view = UIView()
            view.backgroundColor = colors[index % colors.count]
            stackView.addArrangedSubview(view)
        }
    }
}


class CollectionViewController: UICollectionViewController {
  private let reuseIdentifier = "PhotoCell"
  private let thumbnailSize = CGSize(width: 70.0, height: 70.0)
  private let sectionInsets = UIEdgeInsets(top: 10, left: 5.0, bottom: 10.0, right: 5.0)
  private let photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let cell = sender as? UICollectionViewCell,
      let indexPath = collectionView?.indexPath(for: cell),
      let zoomedPhotoViewController = segue.destination as? ZoomedPhotoViewController {
      zoomedPhotoViewController.photoName = "photo\(indexPath.row + 1)"
    }
  }
}

// MARK:- UICollectionViewDataSource
extension CollectionViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
    let fullSizedImage = UIImage(named:photos[indexPath.row])
    cell.imageView.image = fullSizedImage?.thumbnailOfSize(thumbnailSize)
    return cell
  }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension CollectionViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return thumbnailSize
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
}
class ViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var textView: UITextView!
    @IBOutlet var textViewBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        textView.text = ""
        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        textView.backgroundColor = self.view.backgroundColor
        textView.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.view.endEditing(true) // Скрытие клавиатуры вызванной для любого объекта
        
//        textView.resignFirstResponder() // Скрытие клавиатуры вызванной для конкретного объекта
    }
    
    @objc func updateTextView(notification: Notification) {
        
        guard
            let userInfo = notification.userInfo as? [String: Any],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: keyboardFrame.height - textViewBottomConstraint.constant,
                                                 right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        
        textView.scrollRangeToVisible(textView.selectedRange)
    }
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = .white
        textView.textColor = .gray
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 60
    }
}
