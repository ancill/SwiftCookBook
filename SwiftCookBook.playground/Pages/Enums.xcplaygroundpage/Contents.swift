enum ArithmeticExpression {
    // указатель на конкретное значение
    case number(Int)
    // указатель на операцию сложения
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    // указатель на операцию вычитания
    indirect case subtraction(ArithmeticExpression, ArithmeticExpression)
    // указатель на операцию умножения
    indirect case multiplaction(ArithmeticExpression, ArithmeticExpression)
    // указатель на операцию деления
    indirect case division(ArithmeticExpression, ArithmeticExpression)
    // указатель на операцию возведения в степень
    indirect case pow(ArithmeticExpression, ArithmeticExpression)
    // метод, проводящий операцию
    func evaluate(_ expression: ArithmeticExpression? = nil) -> Int {
        // определение типа операнда (значение или операция)
        switch expression ?? self {
            case .number(let value):
                return value
            case .addition(let valueLeft, let valueRight):
                return self.evaluate(valueLeft) + self.evaluate(valueRight)
            case .subtraction(let valueLeft, let valueRight):
                return self.evaluate(valueLeft) - self.evaluate(valueRight)
            case .multiplaction(let valueLeft, let valueRight):
                return self.evaluate(valueLeft) * self.evaluate(valueRight)
            case .division(let valueLeft, let valueRight):
                return self.evaluate(valueLeft) / self.evaluate(valueRight)
            case .pow(let valueLeft, let valueRight):
                if self.evaluate(valueRight) == 0 {
                    return 1
                } else {
                    var result = self.evaluate(valueLeft)
                    for _ in 1 ..< self.evaluate(valueRight) {
                        result *= self.evaluate(valueLeft)
                    }
                    return result
                }
        }
    }
}

var hardExpr = ArithmeticExpression.pow(.number(3), .number(3))
hardExpr.evaluate() // 27
hardExpr = ArithmeticExpression.multiplaction(.number(3), .number(3))
hardExpr.evaluate() // 9

// 1-3
enum Chessman {
    enum Color: String {
        case white
        case black
    }

    case king(color: Color)
    case queen(color: Color)
    case bishop(color: Color)
    case knight(color: Color)
    case rook(color: Color)
    case pawn(color: Color)
}

// 4
var whiteKing: Chessman = .king(color: .white)
var blackKing: Chessman = .king(color: .black)
var whiteBishop: Chessman = .bishop(color: .white)

// 5
// Способ 1
// В операторе switch вы можете указать конкретное значение элемента перечисления и связанного с ним параметра
// Примечание: В данном примере  switch-case содержит только 4 варианта (+ блок default). Все остальные варианты вы можете добавить по аналогии.
switch whiteKing {
    case .king(color: .white):
        print("Белый король")
    case .king(color: .black):
        print("Черный король")
    case .bishop(color: .white):
        print("Белый король")
    case .bishop(color: .black):
        print("Черный король")
    default:
        break
}

// Способ 2
// Использование связанного параметра
// Связанный параметр (с ним мы знакомимлись при изучении оператора switch) указывает вместе с оператором let или var
switch whiteKing {
    case .king(let a):
        if a == .white {
            print("Белый король")
        } else {
            print("Черный король")
        }
    default:
        break
}

// 6
var color: Chessman.Color = .black

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune,
         pluto = 999
}
