import Foundation

struct Point {
    var coodinates: (x: Int, y: Int)
    func getDistance( _ point: Point) -> Double{
        return sqrt(
            pow(Double( point.coodinates.x - self.coodinates.x ), 2) +
            pow(Double( point.coodinates.y - self.coodinates.y ), 2)
        )
    }
}

var p1 = Point(coodinates: (10,20))
var p2 = Point(coodinates: (15,22))
p1.getDistance(p2)

//Ответ
//1
enum Color: String {
    case white = "white"
    case black = "black"
}
//2
enum Type: String {
    case king = "king"
    case queen = "queen"
    case bishop = "bishop"
    case knight = "knight"
    case rook = "rook"
    case pawn = "pawn"
}
//3
var color: Color = .white
var figure: Type = .king
//4
struct Chessman {
    var color: Color
    var type: Type
    var coordinates: (Character, UInt)?
    var symbol: Character
    //инициализатор
    init(color: Color, type: Type) {
        self.color = color
        self.type = type
        self.coordinates = nil
        // символ-заполнитель
        self.symbol = "?"
    }
    //инициализатор
    init(color: Color, type: Type, coordinates: (Character, UInt), symbol: Character) {
        self.color = color
        self.type = type
        self.coordinates = coordinates
        self.symbol = symbol
    }
    //установка координат
    mutating func setCoordinates(char: Character, num: UInt) {
        self.coordinates = (char, num)
    }
    //убрать фигуру с поля
    mutating func kill(){
        self.coordinates = nil
    }
}
//5
var whiteKing = Chessman(color: .white, type: .king)
whiteKing.setCoordinates(char: "C", num: 3)
whiteKing.kill()
var blackKing = Chessman(color: .black, type: .king, coordinates: ("A",2), symbol: "\u{265A}")
