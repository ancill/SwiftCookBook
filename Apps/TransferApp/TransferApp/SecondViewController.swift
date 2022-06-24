//
//  SecondViewController.swift
//  TransferApp
//
//  Created by 19072382 on 24.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var dataTextField: UITextField!
    var updatingData: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }

    // обновляем данные в текстовом поле
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }


}
