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
    @IBOutlet weak var CollectionOutlet: UICollectionView!
    override func viewDidLoad() {
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
        cell.backgroundColor = delegate.playerDecks[delegate.playerNames.firstIndex(of: delegate.currentplayer)!][indexPath.row].color
        cell.cardTypeLabel.text = delegate.playerDecks[delegate.playerNames.firstIndex(of: delegate.currentplayer)!][indexPath.row].type
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCard = delegate.playerDecks[delegate.playerNames.firstIndex(of: delegate.currentplayer)!][indexPath.row]
        selectedCardIndex = indexPath.row
    }
    @IBAction func playAction(_ sender: Any) {
        if selectedCard.color == delegate.currentCard.color || selectedCard.type == delegate.currentCard.type ||
            selectedCard.color == UIColor.darkGray{
            delegate.discardDeck.append(delegate.currentCard)
            if selectedCard.color == UIColor.darkGray{
                selectedCard.color = UIColor.red
            }
            delegate.currentCard = selectedCard
            self.navigationController?.popViewController(animated: true)
            delegate.playerDecks[playerIndex].remove(at: selectedCardIndex)
            CollectionOutlet.reloadData()
            
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
