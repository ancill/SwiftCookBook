import UIKit

protocol TasksStorageProtocol {
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks: [TaskProtocol])
}

// Сущность "Хранилище задач"
class TasksStorage: TasksStorageProtocol {
    // Ссылка на хранилище
    private var storage = UserDefaults.standard
    // Ключ, по которому будет происходить сохранение и загрузка хранилища из User Defaults
    var storageKey: String = "tasks"
    // Перечисление с ключами для записи в User Defaults
    private enum TaskKey: String {
        case title
        case type
        case status
    }

    func loadTasks() -> [TaskProtocol] {
        var resultTasks: [TaskProtocol] = []
        let tasksFromStorage = storage.array(forKey: storageKey) as?
            [[String: String]] ?? []
        for task in tasksFromStorage {
            guard let title = task[TaskKey.title.rawValue],
                  let typeRaw = task[TaskKey.type.rawValue],
                  let statusRaw = task[TaskKey.status.rawValue]
            else {
                continue
            }
            let type: TaskPriority = typeRaw == "important" ? .important : .normal
            let status: TaskStatus = statusRaw == "planned" ? .planned : .completed
            resultTasks.append(Task(title: title, type: type, status: status))
        }
        return resultTasks
    }

//    func loadTasks() -> [TaskProtocol] {
//        // временная реализация, возвращающая тестовую коллекцию задач
//        let testTasks: [TaskProtocol] = [
//            Task(title: "Купить хлеб", type: .normal, status: .planned),
//            Task(title: "Помыть кота", type: .important, status: .planned),
//            Task(title: "Отдать долг Арнольду", type: .important, status: .completed),
//            Task(title: "Купить новый пылесос", type: .normal, status: .completed),
//            Task(title: "Подарить цветы супруге", type: .important, status: .planned),
//            Task(title: "Позвонить родителям", type: .important, status: .completed),
//            Task(title: "Пригласить на вечеринку Дольфа, Джеки, Леонардо, Уилла и Брюса", type: .important, status: .planned)
//        ]
//
//        return testTasks
//    }

    func saveTasks(_ tasks: [TaskProtocol]) {}
}
