import UIKit

class ViewController: UIViewController {
    var game: Game!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    // MARK: - Работа с переходом к SecondViewController
    // ленивое свойство для хранения View Controller
    lazy var secondViewController: SecondViewController = getSecondViewController()

    // приватный метод, загружающий View Controller
    private func getSecondViewController() -> SecondViewController {
        // Загрузка storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Загрузка View Controller и его сцены со Storyboard
        let viewController = storyboard.instantiateViewController(identifier: "SecondViewController")
        return viewController as! SecondViewController
    }
    
    @IBAction func showNextScreen() {
        // Отображение сцены на экране
        self.present(self.secondViewController, animated: true, completion: nil)
    }
    // MARK: - Жизненный цикл по загрузки экрана
    override func loadView() {
        super.loadView()
        // Создаем метку для вывода номера версии
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 300, height: 20))
        // изменяем текст метки
        versionLabel.text = "Версия 1.1 "
        // добавляем метку в родительский view
        self.view.addSubview(versionLabel)
        print("loadView")
    }

    // MARK: - Жизненный цикл после загрузки экрана
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create instance of Game
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        // Recalculate value of Label with Secret random value
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    // MARK: - Взаимодействие View - Model
    
    // Check value that player choose
    @IBAction func checkNumber() {
        // calculate score by round
        game.calculateScore(with: Int(slider.value))
        
        // Check if game is ended
        if game.isGameEnded {
          //  showAlertWIth(score: game.score)
            // start game again
            game.restartGame()
        } else {
            game.startNewRound()
        }
        // update new values from secret number generator
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
        
    }
   
    // MARK: - Обновление View
    // Обновление текста загаданного числа
    private func updateLabelWithSecretNumber(newText: String ) {
        label.text = newText
    }
    
    
    
}
