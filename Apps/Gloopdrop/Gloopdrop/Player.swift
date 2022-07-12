import Foundation
import SpriteKit

// This enum lets you easily switch between animations
enum PlayerAnimationType: String {
    case walk
}

class Player: SKSpriteNode {
    // MARK: - PROPERTIES

    // Textures (Animation)
    private var walkTextures: [SKTexture]?

    // MARK: - INIT

    init() {
        // Set default texture
        let texture = SKTexture(imageNamed: "blob-walk_0")
        // Call to super.init
        super.init(texture: texture, color: .clear, size: texture.size())
        // Set up animation textures
        self.walkTextures = self.loadTextures(atlas: "blob", prefix: "blob-walk_", startsAt: 0, stopsAt: 2)
        // Set up other properties after init
        self.name = "player"
        self.setScale(1.0)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.0) // center-bottom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}
