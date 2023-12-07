//
//  DeckViewController.swift
//  Ultimate Uno
//
//  Created by BRIAN WANG on 12/5/23.
//

import UIKit

class DeckViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var CollectionOutlet: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionOutlet.dataSource = self
        CollectionOutlet.delegate = self

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate.playerDecks[delegate.playerNames.firstIndex(of: delegate.currentplayer)!].count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        cell.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1.0)
        return cell
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
