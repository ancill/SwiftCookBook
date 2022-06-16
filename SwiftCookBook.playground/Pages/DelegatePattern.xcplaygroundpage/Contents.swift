import Foundation

/*:
 Структура базового (делегирующего) элемента может быть построена таким образом, что он переда- ет поступившую к нему задачу на выполнение другому элементу (делегату). При этом результат выполнения задачи может быть возвращен, а может и вовсе не возвращаться в базовый элемент: все зависит от конкретного случая.

 */

protocol MessageProtocol {
    // текст сообщения
    var text: String? { get set }
    // прикрепленное изображение
    var image: Data? { get set }
    // прикрепленный аудио
    var audio: Data? { get set }
    // прикрепленный видео
    var video: Data? { get set }
    // дата отправки
    var sendDate: Date { get set } // отправитель
    var senderID: UInt { get set }
}

struct Message: MessageProtocol {
    var text: String?
    var image: Data?
    var audio: Data?
    var video: Data?
    var sendDate: Date
    var senderID: UInt
}

protocol StatisticDelegate: AnyObject {
    func handle(message: MessageProtocol)
}

protocol MessengerProtocol {
    // массив всех сообщений
    var messages: [MessageProtocol] { get set }
    // делегат для ведения статистики
    var statisticDelegate: StatisticDelegate? { get set }
    // инициализатор
    init()
    // принять сообщение
    mutating func receive(message: MessageProtocol)
    // отправить сообщение
    mutating func send(message: MessageProtocol)
}

class StatisticManager: StatisticDelegate {
    func handle(message: MessageProtocol) {
        // ...
        // обработка сообщения
        // ...
        print("обработка сообщения от User # \(message.senderID) завершена")
    }
}

class Messenger: MessengerProtocol {
    var messages: [MessageProtocol]
    weak var statisticDelegate: StatisticDelegate?
    required init() {
        messages = []
    }

    func receive(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
        // ...
        // прием сообщения
        // ...
    }

    func send(message: MessageProtocol) {
        statisticDelegate?.handle(message: message)
        messages.append(message)
        // ...
        // отправка сообщения
        // ...
    }

}

extension Messenger: StatisticDelegate {
    func handle(message: MessageProtocol) {
        // ...
        // обработка сообщения
        // ...
        print("обработка сообщения от User # \(message.senderID) завершена")
    }
}

var messenger = Messenger()
// messenger.statisticDelegate = StatisticManager()
messenger.statisticDelegate = messenger.self
messenger.send(message: Message(text: "Привет!", sendDate: Date(), senderID: 1))
messenger.send(message: Message(text: "Привет!", sendDate: Date(), senderID: 1))
messenger.messages.count // 1
(messenger.statisticDelegate as! Messenger).messages.count // 0
