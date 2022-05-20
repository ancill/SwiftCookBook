// Отличие -- значение класса передается по ссылке, а структуры — копированием.

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
