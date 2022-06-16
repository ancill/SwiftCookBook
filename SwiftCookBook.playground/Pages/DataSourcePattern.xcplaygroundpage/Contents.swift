import Foundation

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

protocol MessengerProtocol {
    // массив всех сообщений
    var messages: [MessageProtocol] { get set }
    // инициализатор
    init()
    // принять сообщение
    mutating func receive(message: MessageProtocol)
    // отправить сообщение
    mutating func send(message: MessageProtocol)
    // делегат для загрузки сообщения
    var dataSource: MessengerDataSourceProtocol? { get set }
}

class Messenger: MessengerProtocol {
    var messages: [MessageProtocol]
    required init() {
        messages = []
    }

    func receive(message: MessageProtocol) {
        messages.append(message)
        // ...
        // прием сообщения
        // ...
    }

    func send(message: MessageProtocol) {
        messages.append(message)
        // ...
        // отправка сообщения
        // ...
    }

    weak var dataSource: MessengerDataSourceProtocol? {
        didSet {
            if let source = dataSource {
                messages = source.getMessages()
            }
        }
    }
}



/*:
 Шаблон «Источник данных» (Data Source) – это частный случай шаблона «Делегирование». Если в случае классического делегирования вы передаете делега- ту данные для обработки, то в «» базовый элемент наоборот запрашивает данные для самостоятельного решения задачи.

 Делегирование: Вам поступает две внушительные по своим размерам пачки сче-тов от налоговой, вы просто передаете их своему бухгалтеру (делегату) и даете указание разобраться.

 Источник данных: Вы обращаетесь к своему бухгалтеру с указанием выдать список работников с заработной платой более 300 тысяч рублей.
    То есть, в первом случае вы передаете данные делегату, а во-втором – делегат (источник) передает данные вам.
 */

protocol MessengerDataSourceProtocol: AnyObject {
    func getMessages() -> [MessageProtocol]
}

extension Messenger: MessengerDataSourceProtocol {
    func getMessages() -> [MessageProtocol] {
        //  загрузку сообщений с сервера или из базы данных.
        sleep(2)
        return [Message(text: "Как дела?", sendDate: Date(), senderID: 2)]
    }
}
var messenger = Messenger()
messenger.dataSource = messenger.self
messenger.messages.count // 1
