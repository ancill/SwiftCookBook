import GameplayKit
import SpriteKit
class GameScene: SKScene {
    override func didMove(to view: SKView) {
        // Set up background
        let background = SKSpriteNode(imageNamed: "background_1")
        background.anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)

        // Set up foreground
        let foreground = SKSpriteNode(imageNamed: "foreground_1")
        foreground.anchorPoint = CGPoint(x: 0, y: 0)
        foreground.position = CGPoint(x: 0, y: 0)
        addChild(foreground)
        
        // Set up player
        let player = Player()
        player.position = CGPoint(x: size.width/2, y: foreground.frame.maxY)
        addChild(player)
    }
}
