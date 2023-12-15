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
    
    @IBOutlet weak var countCenter: UILabel!
    @IBOutlet weak var playerCenter: UILabel!
    
    @IBOutlet weak var playerRight: UILabel!
    @IBOutlet weak var countRight: UILabel!
    
    @IBOutlet weak var countLeft: UILabel!
    @IBOutlet weak var PlayerLeft: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
        delegate.currentplayer = delegate.playerNames[0]
    }
    override func viewWillAppear(_ animated: Bool) {
        loadCard()
        rotatePlayers()
        currentPlayerLabel.text = "Current Player: " + delegate.currentplayer + " (" + "\(delegate.playerDecks[delegate.playerNames.firstIndex(of: delegate.currentplayer)!].count)" + ")"
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
        while delegate.currentCard.color == UIColor.darkGray{
            delegate.discardDeck.append(delegate.currentCard)
            delegate.currentCard = delegate.drawDeck.remove(at: 0)
        }
        //loading new Card
        loadCard()
    }
    func loadCard(){
        if delegate.currentCard != nil{
            cardLabelOutlet.text = delegate.currentCard.type
            ImageViewOutlet.backgroundColor = delegate.currentCard.color
        }
    }
    func rotatePlayers(){
        let index = delegate.playerNames.firstIndex(of: delegate.currentplayer)!
        var rightIndex = index + 1
        if rightIndex == 4 {
            rightIndex = 0
        }
        var LeftIndex = index - 1
        if LeftIndex == -1 {
            LeftIndex = 3
        }
        var CenterIndex = index + 2
        if (CenterIndex == 4){
            CenterIndex = 0
        } else if(CenterIndex == 5){
            CenterIndex = 1
        }
       
        PlayerLeft.text = delegate.playerNames[LeftIndex]
        countLeft.text = "\(delegate.playerDecks[LeftIndex].count)"
        playerRight.text = delegate.playerNames[rightIndex]
        countRight.text = "\(delegate.playerDecks[rightIndex].count)"
        playerCenter.text = delegate.playerNames[CenterIndex]
        countCenter.text = "\(delegate.playerDecks[CenterIndex].count)"
    }
}
