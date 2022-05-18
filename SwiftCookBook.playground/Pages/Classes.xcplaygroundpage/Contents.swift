// Отличие -- значение класса передается по ссылке, а структуры — копированием.

class Link {
    var property: Int
    init(_ property:Int){
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
