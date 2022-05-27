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
    
    /*:
     СИНТАКСИС
        `Метод UIViewController.present(_:animated:completion)`
     Предназначен для показа элемента в виде модального окна. Данный метод должен быть
     вызван после внесения всех изменений в выводимый элемент.
   
     СИНТАКСИС
     Метод UIAlertController.addAction(_:)
     Предназначен для добавления во всплывающее окно функциональных элементов (кнопок).
     
     СИНТАКСИС
     Класс UIAlertAction
     Создает функциональную кнопку и определяет ее текст, стиль и реакцию на нажатие.
     Доступные свойства и методы:
     var title: String? — текст, расположенный на кнопке.
     var style: UIAlertActionStyle — стиль кнопки.
     var handler: ((UIAlertAction) -> Void)? = nil — обработчик нажатия кнопки.

     СИНТАКСИС
     Перечисление UIAlertAction.Style
     Определяет внешний вид функционального элемента (кнопки) во всплывающем окне. Входит в состав типа UIAlertAction.
     
     Доступные свойства:
     • default — текст кнопки без выделения.
     • cancel — текст кнопки выделен жирным.
     • destructive — текст кнопки выделен красным.
     */
    
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Здарова", message: "Такое вот окно", preferredStyle: .alert)
        
        // создаем кнопку OK
        let actionOK = UIAlertAction(title: "Ок", style: .default, handler: nil)
        // создаем кнопку Отмена
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        // Добаляем обе кнопки в контроллер
        alertController.addAction(actionOK)
        alertController.addAction(actionCancel)
        self.present(alertController, animated: true, completion: nil)
        
    }
}
