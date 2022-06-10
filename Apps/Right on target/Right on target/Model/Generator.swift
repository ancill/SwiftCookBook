import Foundation

protocol GeneratorProtocol {
    var range: (startRangeValue: Int, endRangeValue: Int)  {get}
    func getRandomValue() -> Int
}

struct NumberGenerator: GeneratorProtocol {
    var range: (startRangeValue: Int, endRangeValue: Int)

    init?(from: Int, to: Int) {
        guard from <= to else {
            return nil
        }
        range = (from, to)
    }

    func getRandomValue() -> Int {
        (range.startRangeValue ... range.endRangeValue).randomElement()!
    }
}
