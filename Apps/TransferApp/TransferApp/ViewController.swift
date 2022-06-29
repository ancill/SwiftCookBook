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

class ViewController: UIViewController, UpdatableDataController, DataUpdateProtocol {
    @IBOutlet var dataLabel: UILabel!
    var updatedData: String = "Text test"

    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue) {}
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(withText: updatedData)
    }

    func onDataUpdate(data: String) {
        updatedData = data
        updateLabel(withText: data)
    }

    // Reload text in text field
    private func updateLabel(withText text: String) {
        dataLabel.text = text
    }

    // переход от А к Б
    // передача данных с помощью свойства и установка делегата
    @IBAction func editDataWithDelegate(_ sender: UIButton) {
        // получаем вью контроллер
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        // передаем данные
        editScreen.updatingData = dataLabel.text ?? ""
        // устанавливаем текущий класс в качестве делегата
        editScreen.handleUpdatedDataDelegate = self
        // открываем следующий экран
        navigationController?.pushViewController(editScreen, animated: true)
    }

    @IBAction func editDataWithСlosure(_ sender: UIButton) {
        // получаем вью контроллер
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        // передаем данные
        editScreen.updatingData = dataLabel.text ?? ""
        // передаем необходимое замыкание
        editScreen.completionHandler = { [unowned self] updatedValue in
            updatedData = updatedValue
            updateLabel(withText: updatedValue)
        }
        // открываем следующий экран
        navigationController?.pushViewController(editScreen, animated: true)
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

    // Передача данных с помощью segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // определяем идентификатор segue
        switch segue.identifier {
        case "toEditScreen":
            // обрабатываем переход
            prepareEditScreen(segue)
        default:
            break
        }
    }

    // подготовка к переходу на экран редактирования
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        // безопасно извлекаем опциональное значение
        guard let destinationController = segue.destination as? SecondViewController else {
            return
        }
        destinationController.updatingData = dataLabel.text ?? ""
    }
}
