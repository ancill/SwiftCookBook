//
//  ViewController.swift
//  Right on target
//
//  Created by 19072382 on 30.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0

    //  Метод loadView выполняется первым в жизненном цикле. Как и viewDidLoad, он вызывается лишь один раз за все время жизни сцены.
    override func loadView() {
        super.loadView()
        // Создаем метку для вывода номера версии
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 300, height: 20))
        // изменяем текст метки
        versionLabel.text = "Версия 1.1 "
        // добавляем метку в родительский view
        self.view.addSubview(versionLabel)
        print("loadView")
    }

    //  метод viewDidLoad() вызывается только один раз за всю жизнь сцены. После loadView когда тот загрузил сцену
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // генерируем случайное число
        self.number = Int.random(in: 1 ... 50)
        // устанавливаем загаданное число в метку
        self.label.text = String(self.number)
    }

    /*:
     Метод viewDidAppear вызывается после того, как графические элементы сцены добавлены в иерархию view. В данном методе вы можете произвести действия, которые должны быть выполнены уже после отображения элементов на экране (например, запустить анимацию на сцене или синхронизировать дан- ные с сервером).
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidApear")
    }

    // Методы viewWillDisappear и viewDidDisappear похожи на viewWillAppear и viewDidAppear c той лишь разницей,
    // что они вызываются до и после удаления элементов сцены из иерархии view.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    @IBAction func checkNumber() {
        // получаем значение на слайдере
        let numSlider = Int(slider.value.rounded())
        print(numSlider)

        if numSlider > self.number {
            self.points += 50 - numSlider + self.number
        }
        if numSlider < self.number {
            self.points += 50 - numSlider + self.number
        } else {
            self.points += 50
        }

        print("Очки - \(self.points)")

        if self.round == 5 {
            let alert = UIAlertController(title: "Game over", message: "Вы заработали \(self.points) очков", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.round = 1
            self.points = 0
        } else {
            self.round += 1
        }

        self.number = Int.random(in: 1 ... 50)
        self.label.text = String(self.number)
    }
}
