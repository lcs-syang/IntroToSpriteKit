/*:
 ## Freestyle
 
 Now, it's your turn. What can you create with your newfound knowledge?
 
 */

// Required frameworks
import PlaygroundSupport    // Allows playground to show live view
import SpriteKit            // Provides 2D graphics classes

// Define the animation size, scene, and scene color
let frame = CGRect(x: 0, y: 0, width: 400, height: 300)
var scene = SKScene(size: frame.size)

// Define, configure, and present the scene
let view = SKView(frame: frame)
view.showsNodeCount = true
view.presentScene(scene)

// Show the view in the live view area
PlaygroundSupport.PlaygroundPage.current.liveView = view

/*:
 ### Exercises
 
 Review the example code provided above.
 
 1. Make a new SpriteKit animation using some of the ideas introduced in this playground.
 
 [Previous: Particle Effects](@previous) | Page 9
 
 */
