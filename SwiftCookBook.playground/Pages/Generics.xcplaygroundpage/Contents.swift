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

var array = [1, 7, 9, 11]
search(value: 1, in: array) // true
search(value: 5, in: array) // false

struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.insert(contentsOf: [item], at: 0)
    }

    mutating func pop() -> T {
        return items.removeFirst()
    }
}

extension Stack {
    mutating func replaceFirst(_ newValue: T) {
        items[0] = newValue
    }
}


var genericIntStorage = Stack(items: [1,2,3,4,5])
genericIntStorage.replaceFirst(10)
genericIntStorage.items // [10, 2, 3, 4, 5]
