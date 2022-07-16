import UIKit
/*
 Создавая связь, всегда думайте о том, где и в каком классе находится аутлет-свойство, с которым связывается графический элемент.
 Если оно находится в классе контроллера, перетягивайте на значок контроллера;
 если оно (как в данном случае) на- ходится в классе ячейки, перетягивайте на значок ячейки.
 */
class TaskEditController: UITableViewController {
    @IBOutlet var taskTitle: UITextField!
    @IBOutlet var taskTypeLabel: UILabel!
    @IBOutlet var taskStatusSwitch: UISwitch! // переключатель статуса

    // Название типов задач
    private var taskTitles: [TaskPriority: String] = [
        .important: NSLocalizedString("important", comment: ""),
        .normal: NSLocalizedString("normal", comment: ""),
    ]

    // параметры задачи
    var taskText: String = ""
    var taskType: TaskPriority = .normal
    var taskStatus: TaskStatus = .planned

    override func viewDidLoad() {
        super.viewDidLoad()
        // обновление текстового поля с названием задачи
        taskTitle?.text = taskText

        // обновление метки в соответствии текущим типом
        taskTypeLabel?.text = taskTitles[taskType]

        // обновляем статус задачи
        if taskStatus == .completed {
            taskStatusSwitch.isOn = true
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void)?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskTypeScreen" {
            // ссылка на контроллер назначения
            let destination = segue.destination as! TaskTypeController
            // передача выбранного типа
            destination.selectedType = taskType
            // передача обработчика выбора типа
            destination.doAfterTypeSelected = { [unowned self] selectedType in
                taskType = selectedType
                // обновляем метку с текущим типом
                taskTypeLabel?.text = taskTitles[taskType]
            }
        }
    }

    @IBAction func saveTask(_ sender: UIBarButtonItem) { // получаем актуальные значения
        let title = taskTitle?.text ?? ""
        let type = taskType
        let status: TaskStatus = taskStatusSwitch.isOn ? .completed : .planned // вызываем обработчик
        doAfterEdit?(title, type, status)
        // возвращаемся к предыдущему экрану
        navigationController?.popViewController(animated: true)
    }
}
