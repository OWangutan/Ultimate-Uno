//
//  NameViewController.swift
//  Ultimate Uno
//
//  Created by BRIAN WANG on 12/15/23.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var player4Outlet: UITextField!
      @IBOutlet weak var player3Outlet: UITextField!
      @IBOutlet weak var player2Outlet: UITextField!
      @IBOutlet weak var player1Outlet: UITextField!
      override func viewDidLoad() {
          super.viewDidLoad()
          player1Outlet.text = ""
          player2Outlet.text = ""
          player3Outlet.text = ""
          player4Outlet.text = ""
          
      }
      @IBAction func startAction(_ sender: Any) {
          if let x = player1Outlet.text{
              if x != "" {
                  delegate.playerNames[0] = x
              }
              
          }
          if let x = player2Outlet.text{
              if x != "" {
                  delegate.playerNames[1] = x
              }
              
          }
          if let x = player3Outlet.text{
              if x != "" {
                  delegate.playerNames[2] = x
              }
              
          }
          if let x = player4Outlet.text{
              if x != "" {
                  delegate.playerNames[3] = x
              }
              
          }
          delegate.currentplayer = delegate.playerNames[Int.random(in: 0...3)]
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
