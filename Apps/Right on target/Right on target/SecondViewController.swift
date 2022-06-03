import UIKit

class SecondViewController: UIViewController {
    //  Метод loadView выполняется первым в жизненном цикле. Как и viewDidLoad, он вызывается лишь один раз за все время жизни сцены.
    override func loadView() {
        super.loadView()
        print("loadView SecondViewController")
    }
    /*:
     Метод viewDidAppear вызывается после того, как графические элементы сцены добавлены в иерархию view. В данном методе вы можете произвести действия, которые должны быть выполнены уже после отображения элементов на экране (например, запустить анимацию на сцене или синхронизировать дан- ные с сервером).
     */
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

    /*:
     Метод viewDidAppear вызывается после того, как графические элементы сцены добавлены в иерархию view. В данном методе вы можете произвести действия, которые должны быть выполнены уже после отображения элементов на экране (например, запустить анимацию на сцене или синхронизировать дан- ные с сервером).
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear SecondViewController")
    }

    // Методы viewWillDisappear и viewDidDisappear похожи на viewWillAppear и viewDidAppear c той лишь разницей,
    // что они вызываются до и после удаления элементов сцены из иерархии view.
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
