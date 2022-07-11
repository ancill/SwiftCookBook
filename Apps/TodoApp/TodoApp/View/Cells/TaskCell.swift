//
//  TaskCell.swift
//  TodoApp
//
//  Created by 19072382 on 11.07.2022.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet var symbol: UILabel!
    @IBOutlet var title: UILabel!
    
    // хранилище задач
    var tasksStorage: TasksStorageProtocol = TasksStorage() // коллекция задач
    var tasks: [TaskPriority:[TaskProtocol]] = [:]
    // порядок отображения секций по типам
    // индекс в массиве соответствует индексу секции в таблице
    var sectionsTypesPosition: [TaskPriority] = [.important, .normal]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
