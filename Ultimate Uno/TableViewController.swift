//
//  TableViewController.swift
//  Ultimate Uno
//
//  Created by BRIAN WANG on 12/5/23.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var cardLabelOutlet: UILabel!
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
        delegate.currentplayer = delegate.playerNames[0]
    }
    override func viewDidAppear(_ animated: Bool) {
        loadCard()
    }

    
    func newGame(){
        //adding cards to the deck
        let colors = [UIColor.red, UIColor.yellow, UIColor.green, UIColor.blue]
        let types = ["1","2","3","4","5","6","7","8","9","skip","reverse","+2"]
        for i in 0..<2{
            for c in 0..<colors.count{
                if i == 0 {
                    delegate.drawDeck.append(card(color: colors[c], type: "0"))
                }
                for t in 0..<types.count{
                    delegate.drawDeck.append(card(color: colors[c], type: types[t]))
                }
                if i == 0 {
                    delegate.drawDeck.append(card(color: UIColor.darkGray, type: "wild"))
                } else {
                    delegate.drawDeck.append(card(color: UIColor.darkGray, type: "+4"))
                }
            }
        }
        //shuffleing the drawDeck
        delegate.drawDeck.shuffle()
        //removing the discardDeck
        delegate.discardDeck = []
        //pasting 7 cards to each player
        for i in 0..<delegate.playerDecks.count{
            var tempDeck: [card] = []
            for _ in 0..<7{
                tempDeck.append(delegate.drawDeck.remove(at: 0))
            }
            delegate.playerDecks[i] = tempDeck
        }
        //setting the first Card
        delegate.currentCard = delegate.drawDeck.remove(at: 0)
        //loading new Card
        loadCard()
    }
    func loadCard(){
        if delegate.currentCard != nil{
            cardLabelOutlet.text = delegate.currentCard.type
            ImageViewOutlet.backgroundColor = delegate.currentCard.color
        }
    }
}
