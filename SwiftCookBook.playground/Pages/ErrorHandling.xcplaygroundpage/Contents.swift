import Foundation

struct Item {
    var price: Int
    var count: Int
}

enum VendingMachineError: Error {
    case InvalidSelection
    case InsufficientFunds(coinsNeeded: Int)
    case OutOfStock
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
    ]
    var coinsDeposited = 0
    func dispenseSnack(snack: String) {
        print("Dispensing \(snack)")
    }

    func vend(itemNamed name: String) throws {
        guard var item = inventory[name] else {
            throw VendingMachineError.InvalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.OutOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.InsufficientFunds(coinsNeeded:
                item.price - coinsDeposited)
        }
        coinsDeposited -= item.price
        item.count -= 1
        inventory[name] = item
        dispenseSnack(snack: name)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    print("Неверный выбор")
} catch VendingMachineError.OutOfStock {
    print("Товара нет в наличии")
} catch let VendingMachineError.InsufficientFunds(coinsNeeded) {
    print("Недостаточно средств, пожалуйста, внесите еще \(coinsNeeded) монет(ы)")
}

/*:
 Для преобразования выброшенной ошибки в опциональное значение используется оператор try?. Если в этом случае выбрасывается ошибка, то значение выражения вычисляется как nil.
 */
let x: ()? = try? buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)

/*:
 Структуры и классы для обработки ошибок
 struct - использовать ключевое слово is,
 если объектный тип, описывающий ошибку, может содержать произвольные свойства и методы то as
 */
struct NetworkError: Error {
    var code: Int
}

do {
    // принудительно вызываем исключительную ситуацию
    throw NetworkError(code: 404)
} catch is NetworkError {
    print("it is network error")
}

struct NetworkError1: Error {
    var code: Int
    func description() -> String {
        return "it is network error with code \(code)"
    }
}

do {
    // принудительно вызываем исключительную ситуацию
    throw NetworkError1(code: 404)
} catch let error as NetworkError1 {
    print(error.description())
}
