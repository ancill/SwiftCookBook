import UIKit

class GuessColorContoller: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var scoreLabel: UILabel = .init(frame: CGRect(x: 30, y: 40, width: 300, height: 20))

    var game: Game!
    
    var secretValue = ""
    var winnerButtonHash = 0
    
    func generateRandomColor() -> UIColor {
        let red = NumberGenerator(from: 0, to: 255)!.getRandomValue().hexa
        let green = NumberGenerator(from: 0, to: 255)!.getRandomValue().hexa
        let blue = NumberGenerator(from: 0, to: 255)!.getRandomValue().hexa
        return UIColor(hex: "\(red)\(green)\(blue)")
    }
    
    func updateHexLabel() {
        let color = generateRandomColor()
        // self.label.textColor = color
        label.text = "#" + color.toHexString
        secretValue = color.toHexString
    }
    
    func generateRandomWinnerButton() {
        winnerButtonHash = buttons.randomElement()!.hash
    }
    
    func checkIsCurrentButtonWinn(_ sender: UIButton) -> Bool {
       return sender.hash == winnerButtonHash
    }
    
    func anyButtonPress(_ sender: UIButton) {
       let isWinn = checkIsCurrentButtonWinn(sender)
        if isWinn {
            let alert = UIAlertController(title: "WIN", message: "", preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func loadView() {
        super.loadView()
        scoreLabel.text = "Очков:"
        scoreLabel.textColor = generateRandomColor()
        view.addSubview(scoreLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateHexLabel()
        generateRandomWinnerButton()
        for button in buttons {
            let color = generateRandomColor()
            if winnerButtonHash == button.hash {
                button.tintColor = UIColor(hex: secretValue)
            } else {
                button.tintColor = color
            }
          
            // button.setTitle(color.toHexString, for: .normal)
        }
  
        
    }
    
    @IBAction func clickOnButtonOne(_ sender: UIButton) {
        anyButtonPress(sender)
    }
    
    @IBAction func clickOnButtonTwo(_ sender: UIButton) {
        anyButtonPress(sender)
    }
    
    @IBAction func clickOnButtonThree(_ sender: UIButton) {
        anyButtonPress(sender)
    }
    
    @IBAction func clickOnButtonFour(_ sender: UIButton) {
        anyButtonPress(sender)
    }
}
