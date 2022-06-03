import UIKit

class ThirdViewController: UIViewController {
    override func loadView() {
        super.loadView()
        print("loadView ThirdViewController")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad ThirdViewController")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear ThirdViewController")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear ThirdViewController")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear ThirdViewController")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear ThirdViewController")
    }

}
