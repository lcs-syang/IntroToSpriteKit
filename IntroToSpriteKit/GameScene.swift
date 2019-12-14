//
//  GameScene.swift
//  IntroToSpriteKit
//
//  Created by Russell Gordon on 2019-12-07.
//  Copyright © 2019 Russell Gordon. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class GameScene: SKScene {
    
    // Background music player
    var backgroundMusic: AVAudioPlayer?
    
    // This function runs once to set up the scene
    override func didMove(to view: SKView) {
        
        // Set the background colour
        let background = SKSpriteNode(imageNamed: "sky_01")
        background.position = CGPoint(x:self.size.width / 2, y: self.size.height / 2)
        self.addChild(background)

        // Add the sun
        let sun = SKSpriteNode(imageNamed: "sun")
        sun.position = CGPoint(x: self.size.width / 6 , y: 450)
        self.addChild(sun)
        
        // Add christmas tree
        let tree = SKSpriteNode(imageNamed: "tree1")
        tree.position = CGPoint(x: self.size.width / 2, y: 200)
        let scaleUp = SKAction.scale(by: 2, duration: 0)
        tree.run(scaleUp)
        self.addChild(tree)
        
        
        // Loop for the ground
        for i in 0...14 {
            let groundTile = SKSpriteNode(imageNamed: "ground")
            groundTile.position = CGPoint(x: 0 + groundTile.size.width * CGFloat(i) , y: 30)
            // Add an edge loop physics body to the ground, so nodes with physics bodies do not fall off the screen
            let groundTilePhysicsBodyLocation = CGRect(x:0, y: 0, width: 800, height: 100)
            groundTile.physicsBody = SKPhysicsBody(edgeLoopFrom: groundTilePhysicsBodyLocation)
            self.addChild(groundTile)
        }
        
        // define action for waiting
        let actionTwoSecondWait = SKAction.wait(forDuration: 2)
        //let actionOneSecondWait = SKAction.wait(forDuration: 1)
        let actionThreeSecondWait = SKAction.wait(forDuration: 3)
        
        // Snowman 1
        let snowman1 = SKSpriteNode(imageNamed: "snowman-1")
        snowman1.position = CGPoint(x: 50 , y: 150)
        snowman1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 30))
        self.addChild(snowman1)
        // Define a vector that describes an upward movement
        let upThisMuch = CGVector(dx: 0, dy: 200)
        // Define an action that causes a node to move up for half a second
        let actionUpwardsMovement = SKAction.move(by: upThisMuch, duration: 0)
        // repeat upwards movement
        //let actionRepeatUpwardsMovement = SKAction.repeatForever(actionUpwardsMovement)
        // repeat jump
        snowman1.run(actionUpwardsMovement)
        
        // Snowman 2
        let snowman2 = SKSpriteNode(imageNamed: "snowman-1")
        snowman2.position = CGPoint(x: 250, y: 150)
        snowman2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height:30))
        self.addChild(snowman2)
        // wait two second and move up
        let actionShortWaitThenMoveUp = SKAction.sequence([actionTwoSecondWait, actionUpwardsMovement])
        snowman2.run(actionShortWaitThenMoveUp)
        
        // Snowman 3
        let snowman3 = SKSpriteNode(imageNamed: "snowman-1")
        snowman3.position = CGPoint(x: 550, y: 150)
        snowman3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 30))
        self.addChild(snowman3)
        // move up right away at the same time with snowman 1
        snowman3.run(actionUpwardsMovement)
        
        
        // Snowman 4
        let snowman4 = SKSpriteNode(imageNamed: "snowman-1")
        snowman4.position = CGPoint(x: 750, y: 150)
        snowman4.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 30))
        self.addChild(snowman4)
        // wait for 2 seconds and move up at the same time with snowman 2
        snowman4.run(actionShortWaitThenMoveUp)
        
        // Get a reference to the mp3 file in the app bundle
        let backgroundMusicFilePath = Bundle.main.path(forResource: "sleigh-bells-excerpt.mp3", ofType: nil)!
        
        // Convert the file path string to a URL (Uniform Resource Locator)
        let backgroundMusicFileURL = URL(fileURLWithPath: backgroundMusicFilePath)
        
        // Attempt to open and play the file at the given URL
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: backgroundMusicFileURL)
            backgroundMusic?.play()
        } catch {
            // Do nothing if the sound file could not be played
        }
        
        
        /// texts
        // H
        let textH = SKLabelNode(fontNamed: "Helvetica Neue Light")
        textH.fontSize = 48
        textH.fontColor = .white
        textH.text = "M"
        textH.position = CGPoint(x: 400, y: 650)
        textH.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 30))
        self.addChild(textH)
        let actionThreeSecondWaitThenMoveUp = SKAction.sequence([actionThreeSecondWait, actionUpwardsMovement])
        textH.run(actionThreeSecondWaitThenMoveUp)
        
        // E
        let textE = SKLabelNode(fontNamed: "Helvetica Neue Light")
        textE.fontSize = 48
        textE.fontColor = .white
        textE.text = "E"
        textE.position = CGPoint(x: 435, y: 650)
        textE.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 30))
        textE.run(actionThreeSecondWait)
        self.addChild(textE)
        
        // R
        let textR = SKLabelNode(fontNamed: "Helvetica Neue Light")
        textR.fontSize = 48
        textR.fontColor = .white
        textR.text = "R"
        textR.position = CGPoint(x: 465, y: 650)
        textR.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 30))
        textR.run(actionThreeSecondWait)
        self.addChild(textR)
        
        // R
        let textR1 = SKLabelNode(fontNamed: "Helvetica Neue Light")
        textR1.fontSize = 48
        textR1.fontColor = .white
        textR1.text = "R"
        textR1.position = CGPoint(x: 495, y: 650)
        textR1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 30))
        textR1.run(actionThreeSecondWait)
        self.addChild(textR1)
        
        // Y
        let textY = SKLabelNode(fontNamed: "Helvetica Neue Light")
        textY.fontSize = 48
        textY.fontColor = .white
        textY.text = "Y"
        textY.position = CGPoint(x: 525, y: 650)
        textY.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 30))
        textY.run(actionThreeSecondWait)
        self.addChild(textY)
        
        
        
            
        let wordsPhysicsBodyLocation = CGRect(x: 0, y: 400, width: 800, height: 600)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: wordsPhysicsBodyLocation)
        
        

    }
    
    // This runs before each frame is rendered
    // Avoid putting computationally intense code in this function to maintain high performance
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
