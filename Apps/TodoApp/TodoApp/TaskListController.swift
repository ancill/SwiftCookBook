//
//  TaskListController.swift
//  TodoApp
//
//  Created by 19072382 on 04.07.2022.
//

import UIKit

class TaskListController: UITableViewController {
    // хранилище задач
    var tasksStorage: TasksStorageProtocol = TasksStorage() // коллекция задач
    var tasks: [TaskPriority: [TaskProtocol]] = [:]
    // порядок отображения секций по типам
    // индекс в массиве соответствует индексу секции в таблице
    var sectionsTypesPosition: [TaskPriority] = [.important, .normal]

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTasks()
    }

    private func loadTasks() {
        // подготовка коллекции с задачами
        // будем использовать только те задачи, для которых определена секция в таблице
        sectionsTypesPosition.forEach { taskType in
            tasks[taskType] = []
        }
        // загрузка и разбор задач из хранилища
        tasksStorage.loadTasks().forEach { task in
            tasks[task.type]?.append(task)
        }
    }

    // возвращает количество секций в таблице;
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return tasks.count
    }

    //  возвращает количество строк в определенной секции таблицы;
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // определяем приоритет задач, соответствующий текущей секции
        let taskType = sectionsTypesPosition[section]
        guard let currentTasksType = tasks[taskType] else {
            return 0
        }
        return currentTasksType.count
    }

    // ячейка для строки таблицы
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getConfiguredTaskCell_constraints(for: indexPath)
    }

    // ячейка на основе ограничений
    private func getConfiguredTaskCell_constraints(for indexPath: IndexPath) -> UITableViewCell {
        // загружаем прототип ячейки по идентификатору
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCellConstraints", for: indexPath)
        // получаем данные о задаче, которую необходимо вывести в ячейке
        let taskType = sectionsTypesPosition[indexPath.section]
        guard let currentTask = tasks[taskType]?[indexPath.row] else {
            return cell
        }
        // текстовая метка символа
        let symbolLabel = cell.viewWithTag(1) as? UILabel // текстовая метка названия задачи
        let textLabel = cell.viewWithTag(2) as? UILabel
        // изменяем символ в ячейке
        symbolLabel?.text = getSymbolForTask(with: currentTask.status) // изменяем текст в ячейке
        textLabel?.text = currentTask.title
        // изменяем цвет текста и символа
        if currentTask.status == .planned {
            textLabel?.textColor = .black
            symbolLabel?.textColor = .black
        } else {
            textLabel?.textColor = .lightGray
            symbolLabel?.textColor = .lightGray
        }
        return cell
    }

    // возвращаем символ для соответствующего типа задачи
    private func getSymbolForTask(with status: TaskStatus) -> String {
        var resultSymbol: String
        if status == .planned {
            resultSymbol = "\u{25CB}"
        } else if status == .completed {
            resultSymbol = "\u{25C9}"
        } else {
            resultSymbol = ""
        }
        return resultSymbol
    }
}
