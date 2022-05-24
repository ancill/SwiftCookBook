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

var blackKing = Chessman(color: .black, type: .king, coordinates: ("A", 2), symbol: "\u{265A}")

whiteKing.setCoordinates(char: "C", num: 3)


struct Person {
    var name: String
    var surName: String
    
    init(name: String) {
        self.name = name
        self.surName = ""
    }
    
    init(name: String, surName: String) {
        self.name = name
        self.surName = surName
    }
    
    func getName() -> String {
        return "Ваше имя - \(name) \(surName)"
    }
    
    mutating func setName(name: String, surName: String) {
        self.name = name
        self.surName = surName
    }
}

var ivan = Person(name: "Ivan")
ivan.getName()

ivan.setName(name: "Vanya", surName: "Arsenev")

ivan.getName()

print(ivan.getName())

struct City {
    var population: Int
    var description: String {
        if self.population < 100_000 {
            return "Это небольшой город"
        } else if self.population < 1_000_000 {
            return "Это город среднего размера"
        } else {
            return "Это большой город"
        }
    }
}

let moscow = City(population: 17_000_000)
let spb = City(population: 3_000_000)
spb.description


struct NewsStory {
  static var breakingNewsCount = 0
  static var regularNewsCount = 0
  var headline: String
  init(headline: String, isBreaking: Bool) {
    self.headline = headline
    if isBreaking {
      NewsStory.breakingNewsCount += 1
    } else {
      NewsStory.regularNewsCount += 1
    }
  }
}

struct Wine {
  var age: Int
  var isVintage: Bool
  var price: Int {
    if isVintage {
      return age + 20
    } else {
      return age + 5
    }
  }
}

let malbec = Wine(age: 2, isVintage: true)
print(malbec.price)


//13
protocol GeometricFigureWithXAxis {
    var x: Int { get set }
}

protocol GeometricFigureWithYAxis {
    var y: Int { get set }
}

protocol GeometricFigureTwoAxis: GeometricFigureWithXAxis, GeometricFigureWithYAxis {
    var distanceFromCenter: Float { get }
}

struct Figure2D: GeometricFigureTwoAxis {
    var x: Int = 0
    var y: Int = 0
    var distanceFromCenter: Float {
        let xPow = pow(2, Double(self.x))
        let yPow = pow(2, Double(self.y))
        let length = sqrt(xPow + yPow)
        return Float(length)
    }
}

Figure2D(x: 10, y: 5).distanceFromCenter // 32
