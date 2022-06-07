import UIKit

class GuessNumberController: UIViewController {
    var game: Game!

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    var scoreLabel: UILabel = .init(frame: CGRect(x: 20, y: 20, width: 300, height: 20))

    // MARK: - Работа с переходом к SecondViewController
//
//    // ленивое свойство для хранения View Controller
//    lazy var secondViewController: GuessNumberController = getGuessNumberController()
//
//    // приватный метод, загружающий View Controller
//    private func getGuessNumberController() -> GuessNumberController {
//        // Загрузка storyboard
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        // Загрузка View Controller и его сцены со Storyboard
//        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
//        return viewController as! GuessNumberController
//    }
//
//    @IBAction func showNextScreen() {
//        // Отображение сцены на экране
//        present(secondViewController, animated: true, completion: nil)
//    }

    // MARK: - Жизненный цикл по загрузки экрана

    override func loadView() {
        super.loadView()
        // изменяем текст метки
        scoreLabel.text = "Очков:"
        scoreLabel.textColor = .systemPink
        // добавляем метку в родительский view
        view.addSubview(scoreLabel)
        print("loadView")
    }

    // MARK: - Жизненный цикл после загрузки экрана

    override func viewDidLoad() {
        super.viewDidLoad()
        // Create instance of Game
        game = Game(valueGenerator: NumberGenerator(from: 1, to: 50)!, rounds: 5)
        game.startNewRound()
        // Recalculate value of Label with Secret random value
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }

    // MARK: - Взаимодействие View - Model

    // Check value that player choose
    @IBAction func checkNumber() {
        // calculate score by round
        game.currentRound.calculateScore(with: Int(slider.value))
        updateScoreLabel(String(game.score))
        // Check if game is ended
        if game.isGameEnded {
            showAlertWith(score: game.score)
            // start game again
            game.restartGame()
        } else {
            game.startNewRound()
        }
        // update new values from secret number generator
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }

    // MARK: - Обновление View

    // Обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }

    // Обновление текста количества очков на экране
    private func updateScoreLabel(_ newText: String) {
        scoreLabel.text = "Очков: \(newText)"
    }

    private func showAlertWith(score: Int) {
        let alert = UIAlertController(
            title: "Игра окончена",
            message: "Вы заработали \(score) очков",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style:
            .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
