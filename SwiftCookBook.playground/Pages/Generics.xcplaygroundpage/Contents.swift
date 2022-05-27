import Foundation

func printValues<T1, T2>(a: T1, b: T2) {
    print("Значение 1 - \(a), значение 2 - \(b)")
}

printValues(a: "book", b: 15)
printValues(a: 4, b: 5)

func sum1<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}

sum1(1, 6) // 7
sum1(1.1, 7.8) // 8.9
// sum1("one", "two") // вызовет ошибку

func sum2<T>(_ a: T, _ b: T) -> T where T: Numeric {
    return a + b
}

sum2(1, 6) // 7
sum2(1.1, 7.8) // 8.9
// sum2("one", "two") // вызовет ошибку

func search<T: Comparable>(value: T, in collection: [T]) -> Bool {
    for item in collection {
        if item == value {
            return true
        }
    }
    return false
}

func search2<T1, T2>(value: T1, in collection: T2) -> Bool
    where T1: Comparable, T2: Collection, T1 == T2.Element
{
    for item in collection {
        if item == value {
            return true
        }
    }
    return false
}

var array = [1, 7, 9, 11]
search(value: 1, in: array) // true
search(value: 5, in: array) // false

struct Stack1<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.insert(contentsOf: [item], at: 0)
    }

    mutating func pop() -> T {
        return items.removeFirst()
    }
}

extension Stack1 {
    mutating func replaceFirst(_ newValue: T) {
        items[0] = newValue
    }
}

var genericIntStorage = Stack1(items: [1, 2, 3, 4, 5])
genericIntStorage.replaceFirst(10)
genericIntStorage.items // [10, 2, 3, 4, 5]

// -------------------------------------------
// Таким образом, ItemType (аналогично Element в протоколе Collection) — это некий заполнитель, который используется, чтобы описать требования в теле протокола.
protocol StackProtocol {
    associatedtype ItemType
    var items: [ItemType] { get set }
    mutating func push(_ item: ItemType)
    mutating func pop() -> ItemType
}

extension StackProtocol {
    mutating func push(_ item: ItemType) {
        items.insert(contentsOf: [item], at: 0)
    }

    mutating func pop() -> ItemType {
        return items.removeFirst()
    }
}

struct Stack<T>: StackProtocol {
    typealias ItemType = T
    var items: [T]
}

// Проверка работы
var myStack = Stack(items: [2, 4, 6, 8])
myStack.pop() // 2
myStack.push(9)
myStack.items // [9, 4, 6, 8]

/*:
 Непрозрачные типы (Opaque types)
 
 Можно сказать, что непрозрачные типы — это обратные универсальные шаблоны. При использовании дженериков конкретный тип возвращаемого зна- чения определяет тот, кто вызывает функцию, а при использовании Opaque types конкретный тип определяется реализацией функции (в ее теле) 
 
 Opaque types позволяют указывать тип возвращаемого функцией значения с помощью протокола, использующего связанные типы (или ключевое слово Self) в своей реализации.
 Opaque types позволяют определять тип возвращаемого значения внутри самой функции.
 */
protocol Vehicle {
    associatedtype Identifier
    var uid: Identifier { get set }
}

struct Car: Vehicle {
    var uid: Int
}

//
// Generic
//
func getCar<T: Vehicle>() -> T{
    return Car(uid: 22) as! T
}
// Тип возвращаемого значения определяется тут
let a: Car = getCar()

//
// Opaque type
//
func getCar() -> some Vehicle {
    // Тип возвращаемого значения определяется тут
    return Car(uid: 54)
}
let b = getCar() // Car

