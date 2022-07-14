import UIKit

class TaskTypeController: UITableViewController {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func viewDidLoad() { super.viewDidLoad()
        // 1. получение значение типа UINib, соответствующее xib-файлу кастом- ной ячейки
        let cellTypeNib = UINib(nibName: "TaskTypeCell", bundle: nil)
        // 2. регистрация кастомной ячейки в табличном представлении
        tableView.register(cellTypeNib, forCellReuseIdentifier: "TaskTypeCell")
    }
}
