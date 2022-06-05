import UIKit

protocol GameProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // текущий раунд
    var currentRound: GameRoundProtocol! { get }
    // Проверяет, окончена ли игра
    var isGameEnded: Bool { get }
    // Генератор случайного значения
    var secretValueGenerator: GeneratorProtocol { get }
    // Начинает новую игру и сразу стартует первый раунд
    func restartGame()
    // Начинает новый раунд
    func startNewRound()
}

class Game: GameProtocol {
    private var rounds: [GameRoundProtocol] = []
    var score: Int {
        var totalScore = 0
        for round in rounds {
            totalScore += round.score
        }
        return totalScore
    }

    var currentRound: GameRoundProtocol!
    private var totalRoundsCount: Int!
    var secretValueGenerator: GeneratorProtocol
    var isGameEnded: Bool {
        if totalRoundsCount == rounds.count {
            return true
        } else {
            return false
        }
    }

    init(valueGenerator: NumberGenerator, rounds: Int) {
        secretValueGenerator = valueGenerator
        totalRoundsCount = rounds
    }

    func restartGame() {
        rounds = []
        startNewRound()
    }

    func startNewRound() {
        currentRound = GameRound(secretValue: secretValueGenerator.getRandomValue())
        rounds.append(currentRound)
    }
}
