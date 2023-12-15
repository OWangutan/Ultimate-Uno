//
//  DeckViewController.swift
//  Ultimate Uno
//
//  Created by BRIAN WANG on 12/5/23.
//

import UIKit


class DeckViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let playerIndex = delegate.playerNames.firstIndex(of: delegate.currentplayer)!
    var selectedCard: card! = nil
    var selectedCardIndex = 0
    var didselected = false
    var selectedColor = UIColor.red
    
    @IBOutlet weak var colorButtonOutlet: UIButton!
    @IBOutlet weak var CollectionOutlet: UICollectionView!
    override func viewDidLoad() {
        colorButtonOutlet.tintColor = UIColor.red
        super.viewDidLoad()
        CollectionOutlet.dataSource = self
        CollectionOutlet.delegate = self
        selectedCard = nil
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate.playerDecks[playerIndex].count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CardCell
        cell.backgroundColor = delegate.playerDecks[playerIndex][indexPath.row].color
        cell.cardTypeLabel.text = delegate.playerDecks[playerIndex][indexPath.row].type
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCard = delegate.playerDecks[delegate.playerNames.firstIndex(of: delegate.currentplayer)!][indexPath.row]
        selectedCardIndex = indexPath.row
        didselected = true
    }
    @IBAction func playAction(_ sender: Any) {
        if  didselected == true && (selectedCard.color == delegate.currentCard.color || selectedCard.type == delegate.currentCard.type ||
            selectedCard.color == UIColor.darkGray)  {
            delegate.discardDeck.append(delegate.currentCard)
            if selectedCard.color == UIColor.darkGray{
                selectedCard.color = UIColor.red
            }
            delegate.currentCard = selectedCard
            self.navigationController?.popViewController(animated: true)
            delegate.playerDecks[playerIndex].remove(at: selectedCardIndex)
            CollectionOutlet.reloadData()
            //reverse card
            if(selectedCard.type == "reverse"){
                if(delegate.forward == false){
                    delegate.forward = true
                } else {
                    delegate.forward = false
                }
            }
            //plus 2
            if(selectedCard.type == "+2"){
                if(delegate.forward == true){
                    if (playerIndex + 1 < 4){
                        delegate.playerDecks[playerIndex + 1].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[playerIndex + 1].append(delegate.drawDeck.remove(at: 0))
                    } else {
                        delegate.playerDecks[0].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[0].append(delegate.drawDeck.remove(at: 0))
                    }
                } else {
                    if (playerIndex - 1 >= 0){
                        delegate.playerDecks[playerIndex - 1].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[playerIndex - 1].append(delegate.drawDeck.remove(at: 0))
                    } else {
                        delegate.playerDecks[3].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[3].append(delegate.drawDeck.remove(at: 0))
                    }
                }
            }
            if(selectedCard.type == "+4"){
                if(delegate.forward == true){
                    if (playerIndex + 1 < 4){
                        delegate.playerDecks[playerIndex + 1].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[playerIndex + 1].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[playerIndex + 1].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[playerIndex + 1].append(delegate.drawDeck.remove(at: 0))
                    } else {
                        delegate.playerDecks[0].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[0].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[0].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[0].append(delegate.drawDeck.remove(at: 0))
                    }
                } else {
                    if (playerIndex - 1 >= 0){
                        delegate.playerDecks[playerIndex - 1].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[playerIndex - 1].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[playerIndex - 1].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[playerIndex - 1].append(delegate.drawDeck.remove(at: 0))
                    } else {
                        delegate.playerDecks[3].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[3].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[3].append(delegate.drawDeck.remove(at: 0))
                        delegate.playerDecks[3].append(delegate.drawDeck.remove(at: 0))
                    }
                }
            }
            if(selectedCard.type == "+4" || selectedCard.type == "wild"){
                selectedCard.color = selectedColor
            }
            if(delegate.playerDecks[playerIndex].count == 0){
                delegate.currentCard.type = delegate.currentplayer + " IS THE WINNER"
            }
            if(selectedCard.type == "skip"){
                if(delegate.forward == true){
                    if (playerIndex + 2 == 4){
                        delegate.currentplayer = delegate.playerNames[0]
                    } else if(playerIndex + 2 == 5){
                        delegate.currentplayer = delegate.playerNames[1]
                    }else {
                        delegate.currentplayer = delegate.playerNames[playerIndex + 2]
                    }
                } else {
                    if (playerIndex - 2 == -1){
                        delegate.currentplayer = delegate.playerNames[3]
                    } else if(playerIndex + 2 == -2){
                        delegate.currentplayer = delegate.playerNames[2]
                    }else {
                        delegate.currentplayer = delegate.playerNames[playerIndex - 2]
                    }
                }
            } else {
                if(delegate.forward == true){
                    if (playerIndex + 1 < 4){
                        delegate.currentplayer = delegate.playerNames[playerIndex + 1]
                    } else {
                        delegate.currentplayer = delegate.playerNames[0]
                    }
                } else {
                    if (playerIndex - 1 >= 0){
                        delegate.currentplayer = delegate.playerNames[playerIndex - 1]
                    } else {
                        delegate.currentplayer = delegate.playerNames[3]
                    }
                }
            }
            
            
        } else {
            invaildCard()
        }
    }
    @IBAction func getCardAction(_ sender: Any) {
        if(delegate.drawDeck.count == 0){
            delegate.drawDeck = delegate.discardDeck
            delegate.discardDeck = []
        }
        delegate.playerDecks[playerIndex].append(delegate.drawDeck.remove(at: 0))
        CollectionOutlet.reloadData()
        
    }
    func invaildCard() {
        let alert = UIAlertController(title: "Invaild Card", message: "Please select vaild Card", preferredStyle: .actionSheet)
          
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: false, completion: nil)
        }
          
    }
    @IBAction func ColorAction(_ sender: Any) {
        if(selectedColor == UIColor.red){
            selectedColor = UIColor.blue
            colorButtonOutlet.tintColor = UIColor.blue
            
        } else if (selectedColor == UIColor.blue){
            selectedColor = UIColor.green
            colorButtonOutlet.tintColor = UIColor.green
        }else if (selectedColor == UIColor.green){
            selectedColor = UIColor.yellow
            colorButtonOutlet.tintColor = UIColor.yellow
        } else {
            selectedColor = UIColor.red
            colorButtonOutlet.tintColor = UIColor.red
        }
    }
    
  
}
