import SpriteKit

class GameScene: SKScene {
    var bunny:SKSpriteNode!
    var sinceTouch : TimeInterval = 0
    var spawnTimer: TimeInterval = 0
    let fixedDelta: TimeInterval = 1.0/60.0
    var scrollLayer: SKNode!
    override func didMove(to view: SKView) {
        /* Set up your scene here */
        bunny = self.childNode(withName: "//bunny") as! SKSpriteNode
        scrollLayer = self.childNode(withName: "obstacleLayer")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        let flapSFX = SKAction.playSoundFileNamed("sfx_flap", waitForCompletion: false)
        self.run(flapSFX)
        bunny.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 250))
        bunny.physicsBody?.applyAngularImpulse(1)
        sinceTouch = 0
    }
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
        /* Grab current velocity */
        let velocityY = bunny.physicsBody?.velocity.dy ?? 0
        
        /* Check and cap vertical velocity */
        if velocityY > 400 {
            bunny.physicsBody?.velocity.dy = 400
        }
        /* Apply falling rotation */
        if sinceTouch > 0.1 {
            let impulse = -20000 * fixedDelta
            bunny.physicsBody?.applyAngularImpulse(CGFloat(impulse))
        }
        
        /* Clamp rotation */
        bunny.zRotation = bunny.zRotation.clamped(CGFloat(-20).degreesToRadians(), CGFloat(30).degreesToRadians())
        bunny.physicsBody!.angularVelocity = bunny.physicsBody!.angularVelocity.clamped(-2, 2)
        
        /* Update last touch timer */
        sinceTouch+=fixedDelta
        scrollWorld()
        for ground in (scrollLayer.children as [SKNode]) {
            /* Get ground node position, convert node position to scene space */
            let groundPosition = scrollLayer.convert(ground.position, to: self)

            /* Check if ground sprite has left the scene */
            if groundPosition.x <= -1*ground.frame.width/2 {

                /* Reposition ground sprite to the second starting position */
                let newPosition = CGPoint( x: (self.size.width/2) + ground.frame.width, y: groundPosition.y)

                    /* Convert new node position back to scroll layer space */
                    ground.position = self.convert(newPosition, to: scrollLayer)
            }
        }
    }
    func scrollWorld() {
        /* Scroll World */
        scrollLayer.position.x -= 160 * CGFloat(fixedDelta)
    }
}
