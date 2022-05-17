indirect enum ArithmeticExpression { //
    // указатель на конкретное значение
    case number( Int )
    // указатель на операцию сложения
    case addition( ArithmeticExpression, ArithmeticExpression )
    // указатель на операцию вычитания
    case subtraction( ArithmeticExpression, ArithmeticExpression )
    // указатель на операцию умножения
    case multiply(ArithmeticExpression,ArithmeticExpression)
    // указатель на операцию деления
    case devide(ArithmeticExpression,ArithmeticExpression)
    // указатель на операцию возведения в степень
    case pow( ArithmeticExpression, ArithmeticExpression )
    // метод, проводящий операцию
    func evaluate( _ expression: ArithmeticExpression? = nil ) -> Int {
        // определение типа операнда (значение или операция)
        switch expression ?? self {
            case let .number( value ):
                return value
            case let .addition( valueLeft, valueRight ):
                return evaluate( valueLeft ) + evaluate( valueRight )
            case .subtraction( let valueLeft, let valueRight ):
                return evaluate( valueLeft ) - evaluate( valueRight )
            case .multiply(let valueLeft, let valueRight ):
                return evaluate(valueLeft) * evaluate(valueRight)
            case .devide(let valueLeft, let valueRight):
                return evaluate(valueLeft) / evaluate(valueRight)
            case .pow( let valueLeft, let valueRight ):
                if self.evaluate( valueRight ) == 0 {
                    return 1
                } else {
                    var result = self.evaluate( valueLeft )
                    for _ in 1..<self.evaluate( valueRight ){
                        result *= evaluate( valueLeft )
                    }
                    return result
                }
        }
    }
}
let hardExpr = ArithmeticExpression.addition( .number(20),.subtraction( .number(10), .number(34) ) )
let hardExprMulti = ArithmeticExpression.addition( .number(20),.multiply( .number(10), .number(34) ) )
