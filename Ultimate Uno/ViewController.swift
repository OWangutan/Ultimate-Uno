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
public class deck{
    
    func newDeck() -> [card]{
        var deck: [card] = []
        var colors = [UIColor.red, UIColor.yellow, UIColor.green, UIColor.blue]
        var types = ["1","2","3","4","5","6","7","8","9","skip","reverse","+2"]
        for i in 0..<2{
            
            for c in 0..<colors.count{
                if i == 0 {
                    deck.append(card(color: colors[c], type: "0"))
                }
                for t in 0..<types.count{
                    deck.append(card(color: colors[c], type: types[t]))
                }
                if i == 0 {
                    deck.append(card(color: UIColor.black, type: "wild"))
                } else {
                    deck.append(card(color: UIColor.black, type: "+4"))
                }
            }
        }
        print (deck)
        return deck
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

