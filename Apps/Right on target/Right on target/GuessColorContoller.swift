import UIKit

class GuessColorContoller: UIViewController {
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create instance of Game
        var number = NumberGenerator(from: 1, to: 255)?.getRandomValue()
        print(number)
        // Generate a random value
        
        // Generate a hask value
        let color = UIColor(red: 0x22, green: 0xFF, blue: 0xFF)
        
        label.textColor = color
    }
    
    @IBAction func clickOnButtonOne(_ sender: UIButton) {
    
        
        
    
        
    }
    
    @IBAction func clickOnButtonTwo(_ sender: Any) {}
    
    @IBAction func clickOnButtonThree(_ sender: Any) {}
    
    @IBAction func clickOnButtonFour(_ sender: Any) {}
}
