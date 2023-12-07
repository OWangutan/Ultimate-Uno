//
//  TableViewController.swift
//  Ultimate Uno
//
//  Created by BRIAN WANG on 12/5/23.
//

import UIKit

class TableViewController: UIViewController {
    var drawDeck: [card] = []
    var discardDeck: [card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
        delegate.currentplayer = delegate.playerNames[0]
    }
    

    
    func newGame(){
        //adding cards to the deck
        let colors = [UIColor.red, UIColor.yellow, UIColor.green, UIColor.blue]
        let types = ["1","2","3","4","5","6","7","8","9","skip","reverse","+2"]
        for i in 0..<2{
            for c in 0..<colors.count{
                if i == 0 {
                    drawDeck.append(card(color: colors[c], type: "0"))
                }
                for t in 0..<types.count{
                    drawDeck.append(card(color: colors[c], type: types[t]))
                }
                if i == 0 {
                    drawDeck.append(card(color: UIColor.black, type: "wild"))
                } else {
                    drawDeck.append(card(color: UIColor.black, type: "+4"))
                }
            }
        }
        //shuffleing the drawDeck
        drawDeck.shuffle()
        //removing the discardDeck
        discardDeck = []
        //pasting 7 cards to each player
        for i in 0..<delegate.playerDecks.count{
            var tempDeck: [card] = []
            for _ in 0..<7{
                tempDeck.append(drawDeck.remove(at: 0))
            }
            delegate.playerDecks[i] = tempDeck
        }
    }
}
