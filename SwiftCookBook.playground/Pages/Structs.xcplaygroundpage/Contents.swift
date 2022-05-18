import Foundation

struct Point {
    var coodinates: (x: Int, y: Int)
    func getDistance(_ point: Point) -> Double {
        return sqrt(
            pow(Double(point.coodinates.x - self.coodinates.x), 2) +
                pow(Double(point.coodinates.y - self.coodinates.y), 2)
        )
    }
}

sqrt(29)
pow(3, 2)
var p1 = Point(coodinates: (10, 20))
var p2 = Point(coodinates: (15, 22))
p1.getDistance(p2)

// ------------------------------------------------------------
enum Type {
    case king
    case queen
    case bishop
    case knight
    case rook
    case pawn
}

enum Color {
    case white
    case black
}

struct Chessman {
    var color: Color
    var type: Type
    var coordinates: (char: Character, num: UInt)?
    var symbol: Character

    init(color: Color, type: Type) {
        self.color = color
        self.type = type
        self.coordinates = nil
        self.symbol = "?"
    }

    init(color: Color, type: Type, coordinates: (char: Character, num: UInt)?, symbol: Character) {
        self.color = color
        self.type = type
        self.coordinates = coordinates
        self.symbol = symbol
    }

    mutating func setCoordinates(char: Character, num: UInt) {
        self.coordinates = (char, num)
    }

    mutating func kill() {
        self.coordinates = nil
    }
}

// 5
var whiteKing = Chessman(color: .white, type: .king)
whiteKing.setCoordinates(char: "C", num: 3)
whiteKing.kill()
var blackKing = Chessman(color: .black, type: .king, coordinates: ("A", 2), symbol: "\u{265A}")
