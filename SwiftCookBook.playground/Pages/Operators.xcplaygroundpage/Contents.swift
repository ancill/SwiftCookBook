import Foundation


var currentSecretValue = 35
var score = 0
// Подсчет количество очков
func calculateScore(with value: Int) {
    if value > currentSecretValue {
        score += 50 - value + currentSecretValue
    } else if value < currentSecretValue {
        score += (50 - currentSecretValue + value)
    } else { // Если попал в точку
        score += 50
    }
}

calculateScore(with: 35)
print(score)
