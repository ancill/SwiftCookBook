//
//  ViewController.swift
//  Contacts
//
//  Created by 19072382 on 16.06.2022.
//

import UIKit

class ViewController: UIViewController {
    var userDefaults = UserDefaults.standard
    
   // наблюдатель к свойству contacts, сортирующий массив контактов при каждом его изменении
    private var contacts: [ContactProtocol] = [] {
        didSet {
            contacts.sort{ $0.title < $1.title}
        }
    }
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        print( userDefaults.object(forKey: "Some key") )
        print( userDefaults.string(forKey: "Some key") )
        
        loadContacts()
    }

    private func loadContacts() {
        contacts.append(Contact(title: "Саня Техосмотр", phone: "+799912312323"))
        contacts.append(Contact(title: "Владимир Анатольевич", phone: "+781213342321"))
        contacts.append(Contact(title: "Сильвестр", phone: "+7000911112"))
    }

    @IBAction func showNewContactAlert() {
        // создание Alert Controller
        let alertController = UIAlertController(title: "Создайте новый контакт", message: "Введите имя и телефон", preferredStyle: .alert)
        // добавляем первое текстовое поле в Alert Controller
        alertController.addTextField { textField in
            textField.placeholder = "Имя"
        }
        // добавляем второе текстовое поле в Alert Controller
        alertController.addTextField { textField in
            textField.placeholder = "Номер телефона"
        }
        // создаем кнопки
        // кнопка создания контакта
        let createButton = UIAlertAction(title: "Создать", style: .default) { _ in
            guard let contactName = alertController.textFields?[0].text,
                  let contactPhone = alertController.textFields?[1].text
            else { return }
            // создаем новый контакт
            let contact = Contact(title: contactName, phone: contactPhone)
            self.contacts.append(contact)
            self.tableView.reloadData()
        }
        // кнопка отмены
        let cancelButton = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        // добавляем кнопки в Alert Controller
        alertController.addAction(cancelButton)
        alertController.addAction(createButton)
        // отображаем Alert Controller
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    // Возвращает общее количество строк в таблице, которые потенциально могут быть отображены.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    // Возвращает ячейку, определяющую внешний вид данных, выводимых в конкретной строке.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // производим попытку загрузки переиспользуемой ячейки
        var cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            print("Используем старую ячейку для строки с индексом \(indexPath.row)")
            cell = reuseCell
        } else {
            print("Создаем новую ячейку для строки с индексом \(indexPath.row)")
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        }

        configure(cell: &cell, for: indexPath)
        return cell
    }

    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = contacts[indexPath.row].title
        configuration.secondaryText = contacts[indexPath.row].phone
        cell.contentConfiguration = configuration
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        // delete action with handle clusure
        let actionDelete = UIContextualAction(style: .destructive, title: "Удалять") { _, _, _ in
            self.contacts.remove(at: indexPath.row)
            // формируем таблицу еще раз после удаления
            tableView.reloadData()
        }
        print("Определяем доступные действия для строки \(indexPath.row)")
        // формируем экземпляр, описывающий доступные действия
        return UISwipeActionsConfiguration(actions: [actionDelete])
    }
}
