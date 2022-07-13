import GameplayKit
import SpriteKit
import UIKit
class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Create the view
        if let view = view as! SKView? { // Create the scene
            // let scene = GameScene(size: view.bounds.size)
            let scene = GameScene(size: CGSize(width: 1336, height: 1024))
            print("scene.size: \(scene.size)")
            // Set the scale mode to scale to fill the view window
            scene.scaleMode = .aspectFill
            // Set the background color
            scene.backgroundColor = UIColor(
                red: 105/255,
                green: 157/255,
                blue: 181/255,
                alpha: 1.0)
            // Present the scene
            view.presentScene(scene)
            // Set the view options
            view.ignoresSiblingOrder = false
            view.showsPhysics = false
            view.showsFPS = true
            view.showsNodeCount = true
            // enable it for perfomance/keep in mind that all nodes must have a zPosition
            view.ignoresSiblingOrder = false
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscape
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
