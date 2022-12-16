//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by salsa kh on 2022-12-12.
//  Copyright © 2022 salsa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var player2Field: UITextField!
    @IBOutlet weak var player1Field: UITextField!
   
    
    let segueToGameView = "segueToGameView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        player1Field.resignFirstResponder()
        player2Field.resignFirstResponder()
        
    }
    
    // connect field to GameViewcontroller 
 //   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   //     if let controller = segue.destination as? GameViewController {
           
        
        
     //   }
   // }
    
    
            
    @IBAction func startBtn(_ sender: UIButton) {
        performSegue(withIdentifier: segueToGameView, sender: self)
    }
    
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToGameView {
            if let destinationVC = segue.destination as? GameViewController {
            
                destinationVC.player1Name = player1Field.text
                destinationVC.player2Name = player2Field.text
            }
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "segueToGameView" {
            
            if player1Field.text!.trimmingCharacters(in: .whitespaces).isEmpty{
                return false
            }
            
        }
        return true
    }
}

