import Foundation

/*:
 

 
 ## Интерфейс (Протокол)
 
 Это стандарт, описывающий порядок взаимодействия с объектом.
 Иными словами, это набор требований, которым должен удовлетворять объект, чтобы с ним можно было производить взаимодействие установленным образом.
 
 Использование протоколов обеспечивает целостность типов данных. Другими словами, если некоторый объектный тип подписан на протокол, то с уверенностью можно утверждать, что в нем реализованы требования данного протокола.
 
*/

/*:
 
 ### Инкапсуляция
 — это подход, при котором данные и методы для работы с этими данными объединяются в единую сущность, при этом скрывая свою внутреннюю реализацию.

 
 ```swift
 struct TV: DisplayShow, ChangeVolume {
     // реализация методов и свойств протоколов ...
 }
 ```
 
 */

class TVShow {
    // ...
}

protocol DisplayShow {
    func getShowsList() -> [TVShow]
    func changeShowTo(show: TVShow) -> Void
    var currentShow: TVShow { get }
    // дополнительные требования ...
}

protocol ChangeVolume {
    var currentVolume: UInt8 { get set }
    func increase(by: UInt8) -> Void
    func descrease(by: UInt8) -> Void
    // дополнительные требования...
}


/*:
 ### Полиморфизм
  — это подход, предусматривающий возможность взаимодействия с различными типами данных единым образом в отсутствие информации о кон- кретном типе данных объекта.
 
 ```
 struct DVDPlayer: ChangeVolume {
     // реализация методов и свойств протоколов ...
 }
 
 ```
 
 */

struct Manager {
    var currentDevice: ChangeVolume
    func increaseVolume(by: UInt8) -> Void {
        self.currentDevice.increase(by: by)
    }
    // ...
}
/*:
 ```
 let universalManager = Manager(currentDevice: DVDPlayer())
 universalManager.increaseVolume(by: 1)

 ```
 */

/*:
 Суть протокол-ориентированного программирования состоит в том, что в первую очередь описываются протоколы, а уже потом объектные типы, принимающие их к реализации.
 
 Причина выбрать структуру No 1. Безопасность
 Структуры безопаснее классов. Множественные копии объекта, в отличие от множественных ссылок, не способны привести к случайному, неконтролируемому изменению данных.

 Причина выбрать структуру No 2. Утечки памяти
 В главе об управлении памятью нами был разобран пример утечки памяти. При использовании структур такая проблема исчезает, опять же по причине того, что значения передаются копией, а не в виде ссылки.

 Причина выбрать структуру No 3. Раздутые объектные типы
 Swift не поддерживает множественное наследование. Таким образом, у вас от- сутствует возможность создать класс — наследник нескольких родительских классов.

 No 4. Структуры быстрее классов
 */

class ValueClass {
    var value: Int = 0
}

struct ValueStruct {
    var value: Int = 0
}

var operationArray = Array(1...50_000_000)

// опыт с классом
var startTime = Date().timeIntervalSince1970
var a = ValueClass()

for _ in operationArray {
    a.value += 1
}

var finishTime = Date().timeIntervalSince1970
print("Время выполнения операций с классом - \(finishTime-startTime)")

// опыт со структурой
startTime = Date().timeIntervalSince1970
var b = ValueStruct()

for _ in operationArray {
    b.value += 1
}

finishTime = Date().timeIntervalSince1970
print("Время выполнения операций со структурой - \(finishTime-startTime)")