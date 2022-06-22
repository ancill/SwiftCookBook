import Foundation
protocol ContactProtocol {
    /// Имя
    var title: String { get set }
    /// Номер телефона
    var phone: String { get set }
}

struct Contact: ContactProtocol {
    var title: String
    var phone: String
}

protocol ContactStorageProtocol {
    // load array of contacts
    func load() -> [ContactProtocol]
    // reload array of contacts
    func save(contacts:[ContactProtocol])
}

class ContactStorage: ContactStorageProtocol {
    // link to storage
    private var storage = UserDefaults.standard
    // Access key for storage
    private var storageKey = "contacts"
    
    // enum for keys
    private enum ContactKey: String {
        case title
        case phone
    }
    
    func load() -> [ContactProtocol] {
        var resultContacts: [ContactProtocol] = []
        let contactsFromStorage = storage.array(forKey: storageKey) as? [[String: String]] ?? []
        for contact in contactsFromStorage {
            guard let title  = contact[ContactKey.title.rawValue],
                  let phone = contact[ContactKey.phone.rawValue] else {
                continue
            }
            resultContacts.append(Contact(title: title, phone: phone))
        }
        return resultContacts
    }
    
    func save(contacts: [ContactProtocol]) {
        var arrayForStorage: [[String: String]] = []
        contacts.forEach { contact in
            var newElementForStorage: Dictionary<String,String>  = [:]
            newElementForStorage[ContactKey.title.rawValue] = contact.title
            newElementForStorage[ContactKey.phone.rawValue] = contact.phone
            arrayForStorage.append(newElementForStorage)
        }
        storage.set(arrayForStorage,forKey: storageKey)
    }
}
