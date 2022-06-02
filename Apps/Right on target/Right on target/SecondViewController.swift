//
//  SecondViewController.swift
//  Right on target
//
//  Created by 19072382 on 01.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    override func loadView() {
        super.loadView()
        print("loadView SecondViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad SecondViewController")
    }
    // ленивое хранимое свойство типа SecondViewController, в который будет помещаться экземпляр второй сцены
    // В этом случае вторая сцена загрузится лишь однажды, а при переходе к ней будут вызываться только методы viewWillAppear и viewDidAppear.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear SecondViewController")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear SecondViewController")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear SecondViewController")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear SecondViewController")
    }

    @IBAction func hideCurrentScene() {
        self.dismiss(animated: true, completion: nil)
    }
}
