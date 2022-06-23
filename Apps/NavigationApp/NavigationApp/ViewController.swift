//
//  ViewController.swift
//  NavigationApp
//
//  Created by 19072382 on 22.06.2022.
//

import UIKit

class ViewController: UIViewController {

    // link to storyboard where viewController exist
    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = "Назад"
    }
    
    @IBAction func toGreenScene(_ sender: UIButton) {
        // получаем ссылку на следующий контроллер
        // в данном случае следующий - это зеленый
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "greenViewController")
        // обращаемся к Navigation Controller
        // и вызываем метод перехода к новому контроллеру
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    

    @IBAction func toOrangeScene(_ sender: UIButton) {
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "orangeViewController")
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func toRootScene(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func toPreviousScene(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

