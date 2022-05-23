// Отличие -- значение класса передается по ссылке, а структуры — копированием.

import Foundation
class Link {
    var property: Int
    init(_ property: Int) {
        self.property = property
    }
}

struct Copy {
    var property: Int
}

// экземпляры классов передаются по ссылке
var value = Link(10)
var valueByLink = value
// изменим значение второго параметра
valueByLink.property = 12
// значение первого так же изменилось
value.property // 12
// экземпляры структур передаются копированием
var structValue = Copy(property: 15)
var anotherSctructValue = structValue
// изменив значение копии
anotherSctructValue.property = 12
// исходное значение не меняется
structValue.property // 15

//
// 1) Создайте класс RandomNumberGenerator, которы будет возвращать случайно сгенерированное число. Его инициализатор должен принимать свойства min и max, ограничивающие диапазон возможных значений сверху и снизу (максимальное и минимальное значения). Так же у класса должен быть метод getNumber(), возвращающий случайное целое число (из диапазона min...max).
class RandomNumberGenerator {
    var max: Int = 1
    var min: Int = 0

    init(min: Int, max: Int) {
        if min > 0, min < max {
            self.min = min
        }

        if max > min, max <= 100_000 {
            self.max = max
        }
    }

    func getNumber() -> Int {
        return Int.random(in: min ... max)
    }
}

var number = RandomNumberGenerator(min: 14, max: 10_000)
number.getNumber()

// 2) Создайте структуру Employee, содержащее три свойства:
//
// firstName — имя работника
// secondName — фамилия работника
// salary — заработная плата
// Типы данных свойств определите самостоятельно
// 3) Создайте два массива типа [String] каждый. Первый должен содержать 5 вариантов имен, а второй — пять вариантов фамилий.
// 4) Создайте экземпляр типа Employee. Значения имени и фамилии должны браться случайным образом из созданных в пункте 3 массивов. Значение заработной платы должно быть случайным целым числом в диапазоне от 20000 до 100000. Используйте созданный в шаге 1) класс RandomNumberGenerator.

struct Employee {
    var firstName: String
    var secondName: String

    var salary: Int

    func getFullNameAndSalary() -> String {
        return "Работник - \(firstName) \(secondName) с зарплатой в \(salary) $"
    }
}

var names: [String] = ["Ivan", "Petya", "Gleb", "Sasha", "Victor"]
var surNames: [String] = ["Vodkin", "Sagan", "Gray", "Tronak", "Bashik"]

var randomSeed: Int = RandomNumberGenerator(min: 0, max: names.count - 1).getNumber()
var randomEmployer: Employee = .init(firstName: names[randomSeed], secondName: surNames[randomSeed], salary: RandomNumberGenerator(min: 10_000, max: 100_000).getNumber())

print(randomEmployer.getFullNameAndSalary())

// 1
// суперкласс
class Quadruped {
    var type: String
    var name: String

    init(type: String, name: String) {
        self.type = type
        self.name = name
    }

    func walk() {
        print("walk")
    }
}

class Dog: Quadruped {
    init(name: String) {
        super.init(type: "dog", name: name)
    }

    func bark() {
        print("woof")
    }

    func printName() {
        print(name)
    }
}

var dog = Dog(name: "Bosa")
dog.walk() // выводит walk
dog.bark() // выводит woof
dog.type



// -------------------------------------------
// ----- Утечка пямяти и weak модификатор ----
class House {
    var title: String
    //  Если необходимо сделать слабую ссылку на экземпляр неопционального типа данных,
    //  то используется модификатор unowned вместо weak. Такие ссылки называются бесхозными.
    weak var owner: Human?
    init(title: String, owner: Human? = nil) {
        print("Дом \(title) создан")
        self.title = title
        self.owner = owner
        return
    }

    deinit {
        print("Дом \(title) уничтожен")
    }
}



class Human {
    var name: String
    var houses: [House] = []

    init(name: String) {
        print("Владелец \(name) создан")
        self.name = name
        return
    }

    func add(house: House) {
        houses.append(house)
    }

    deinit {
        print("Владелец \(name) уничтожен")
    }
}

// 7

// создаем область видимости
if true { // шаг 1
    // В куче выделяется память под новый объект ссылочного типа, описывающий владельца (Василий).
    // В стеке создается новый фрейм, в котором выделяется память под константу houseOwner, содержащую ссылку на объект «Василий».
    let houseOwner = Human(name: "Василий")
    if true { // шаг 2
//          В куче создается новый объект типа House, содержащий в свойстве owner слабую ссылку на уже существующий объект типа Human.
//          В стеке создается новый фрейм (#2), в котором выделяется память для константы house, содержащей ссылку на объект тип House (Частный дом).          При этом в свойство houses параметра houseOwner добавляется ссылка на созданный «Частный дом».
        let house = House(title: "Частный дом", owner: houseOwner)
        houseOwner.add(house: house)
    } // шаг 3
//     Происходит выход из области видимости (вложенный оператор if), вследствие чего в стеке удаляется фрейм (#2) и все его элементы.
//     При этом объект типа House (Частный дом) в куче не может быть удален, так как на него ссылается объект houseOwner.
//  -----------------------------------------------------------------------------------------------
    // шаг 4
//    В куче создается новый объект типа House (Квартира).
//    В стеке, в уже существующем фрейме (#1), создается объект secondHouse, содержащий слабую ссылку на объект в куче. При этом создается взаимная ссылка от параметра houseOwner к созданному объекту.
   
    let secondHouse = House(title: "Квартира", owner: houseOwner)
    houseOwner.add(house: secondHouse)
} // шаг 5
//  Оператор if завершает свою работу, и происходит выход из соответствующей области видимости. По этой причине последовательно удаляются элементы фрейма #1 в стеке. В куче все еще находятся три объекта, взаимно ссылающиеся друг на друга. Swift видит данную ситуацию и изменяет значение, хра- нящееся по слабой ссылке (свойства owner в типах House) на nil, тем самым уничтожая объект типа Human.

// Два оставшихся объекта типа House теперь не имеют входящих сильных ссылок, а значит, могут быть безболезненно удалены, что и происходит.
