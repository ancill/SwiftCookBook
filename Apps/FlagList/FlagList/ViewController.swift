import UIKit

class ViewController: UITableViewController {
    var flagList = [String]() {
        didSet {
            flagList.sort { $0 > $1 }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let fm  = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        print(items)
        for item in items {
            if item.hasPrefix("us") {
              print(item)
            }
        }
        
      
    }
}
