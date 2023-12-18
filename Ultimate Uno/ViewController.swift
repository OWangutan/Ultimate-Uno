/*
 Programming Concepts
 1. Variable and constants
 2. Operators
 3. if/else
 4. while loops/for loops
 5. switch Statments
 6. Arrays
 7. functions
 12. classes
 15. safely unwrapping
 23. Github
 25. Scrums and Sprints
 
 
 UI Elements
 1. textfield
 2. button
 3. label
 8. stackview
 11. Collection view
 13. Navigation Controller
 14. View Controller
 15 Alert Contoller
 20. constraints
 
 
 */

import UIKit

public class card{
    var color: UIColor
    var type: String
    init(color: UIColor, type: String) {
        self.color = color
        self.type = type
    }
}

public class delegate {
    static var playerNames = ["player 1","player 2","player 3","player 4"]
    static var playerDecks: [[card]] = [[],[],[],[]]
    static var currentplayer = "player 1"
    static var currentCard: card! = nil
    static var drawDeck: [card] = []
    static var discardDeck: [card] = []
    static var forward = true
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

