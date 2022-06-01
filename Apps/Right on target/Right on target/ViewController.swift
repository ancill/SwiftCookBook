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

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // генерируем случайное число
        self.number = Int.random(in: 1 ... 50)
        // устанавливаем загаданное число в метку
        self.label.text = String(self.number)
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
