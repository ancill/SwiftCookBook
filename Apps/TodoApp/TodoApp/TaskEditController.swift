import UIKit

class TaskEditController: UITableViewController {
    @IBOutlet var taskTitle: UITextField!
    @IBOutlet var taskTypeLabel: UILabel!

    // Название типов задач
    private var taskTitles: [TaskPriority: String] = [
        .important: "Важная",
        .normal: "Текущая",
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
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void)?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { if segue.identifier == "toTaskTypeScreen" {
        // ссылка на контроллер назначения
        let destination = segue.destination as! TaskTypeController
        // передача выбранного типа
        destination.selectedType = taskType
        // передача обработчика выбора типа
        destination.doAfterTypeSelected = { [unwoned self] selectedType in
            taskType = selectedType
            // обновляем метку с текущим типом
            taskTypeLabel?.text = taskTitles[taskType]
        }
    }
    }
}
