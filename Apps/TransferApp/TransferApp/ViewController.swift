//
//  ViewController.swift
//  TransferApp
//
//  Created by 19072382 on 24.06.2022.
//

import UIKit

protocol UpdatableDataController: AnyObject {
    var updatedData: String { get set }
}

class ViewController: UIViewController, UpdatableDataController {

    @IBOutlet var dataLabel: UILabel!
    var updatedData: String = "Text test"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(withText: updatedData)
    }

    // Reload text in text field
    private func updateLabel(withText text: String) {
        dataLabel.text = text
    }

    @IBAction func editDataWithProperty(_ sender: UIButton) {
        // получаем вью контроллер, в который происходит переход
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! UpdatingDataController
        // передаем данные
        editScreen.updatingData = dataLabel.text ?? ""
        // переходим к следующему экрану
        navigationController?.pushViewController(editScreen as! UIViewController, animated: true)
    }
}
