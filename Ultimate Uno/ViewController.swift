//
//  ViewController.swift
//  Ultimate Uno
//
//  Created by BRIAN WANG on 12/5/23.
//

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

