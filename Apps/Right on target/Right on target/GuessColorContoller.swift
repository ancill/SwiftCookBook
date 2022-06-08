import UIKit

class GuessColorContoller: UIViewController {
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.textColor = .systemPink
        
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
