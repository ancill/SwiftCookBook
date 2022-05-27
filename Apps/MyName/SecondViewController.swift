//
//  SecondViewController.swift
//  MyName
//
//  Created by 19072382 on 27.05.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Welcome", message: "This is myName app", preferredStyle: .alert)
        
        /*:
         СИНТАКСИС
            `Метод UIViewController.present(_:animated:completion)`
         Предназначен для показа элемента в виде модального окна. Данный метод должен быть
         вызван после внесения всех изменений в выводимый элемент.
         */
        self.present(alertController, animated: true, completion: nil)
    }
    
}
