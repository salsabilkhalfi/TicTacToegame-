//
//  GameViewController.swift
//  Tic Tac Toe
//
//  Created by salsa kh on 2022-12-13.
//  Copyright © 2022 salsa. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
   
    
    enum Turn {
          case Nought  // O
          case Cross  // X
      }

      @IBOutlet weak var player1LB: UILabel!
      @IBOutlet weak var player2LB: UILabel!
      @IBOutlet weak var closeBtn: UIButton!
      @IBOutlet weak var score1: UILabel!
      @IBOutlet weak var score2: UILabel!
      @IBOutlet weak var turnLb: UILabel!
      @IBOutlet weak var a1: UIButton!
      @IBOutlet weak var a2: UIButton!
      @IBOutlet weak var a3: UIButton!
      @IBOutlet weak var b1: UIButton!
      @IBOutlet weak var b2: UIButton!
      @IBOutlet weak var b3: UIButton!
      @IBOutlet weak var c1: UIButton!
      @IBOutlet weak var c2: UIButton!
      @IBOutlet weak var c3: UIButton!
      
      var firstTurn = Turn.Cross
      var currentTurn = Turn.Cross
      var board = [UIButton]()
  
      
      var noughtsScore = 0
      var crossesScore = 0
      
      
      var NOUGHT = "O" // symbol
      var CROSS = "X"
      

      
   var player1Name: String?
    var player2Name: String?
    
      override func viewDidLoad() {
          super.viewDidLoad()
        
        player1LB.text = player1Name
        player2LB.text = player2Name
        
          initBoard()
          // Do any additional setup after loading the view.
    }
      
      func initBoard()
      {
          board.append(a1)
          board.append(a2)
          board.append(a3)
          board.append(b1)
          board.append(b2)
          board.append(b3)
          board.append(c1)
          board.append(c2)
          board.append(c3)
      }

  
    @IBAction func boardTapAction(_ sender: UIButton) {
          addToBoard(sender)
                  
                  if checkForVictory(CROSS)
                  {
                      crossesScore += 1
                      resultAlert(title: "X Win Congratulations \(player2Name ?? "")!")
                  }
                  
                  if checkForVictory(NOUGHT)
                  {
                      noughtsScore += 1
                      resultAlert(title: "O Win Congratulations \(player1Name ?? "") !")
                  }
                  
                  if(fullBoard())
                  {
                      resultAlert(title: "Draw")
                  }
              }
              
        // kontrollerar om vilikoren stämmer för den symbol (X eller O)

          func checkForVictory(_ s :String) -> Bool
              {
                // Horizontal Victory
                if a1.title(for: .normal) == s && a2.title(for: .normal) == s && a3.title(for: .normal) == s
                {
                    return true
                }
                if b1.title(for: .normal) == s && b2.title(for: .normal) == s && b3.title(for: .normal) == s
                {
                    return true
                }
                if c1.title(for: .normal) == s && c2.title(for: .normal) == s && c3.title(for: .normal) == s
                {
                    return true
                }


                // Vertical Victory
                if a1.title(for: .normal) == s && b1.title(for: .normal) == s && c1.title(for: .normal) == s
                {
                    return true
                }
                if a2.title(for: .normal) == s && b2.title(for: .normal) == s && c2.title(for: .normal) == s
                {
                    return true
                }
                if a3.title(for: .normal) == s && b3.title(for: .normal) == s && c3.title(for: .normal) == s
                {
                    return true
                }

                // Diagonal Victory
                if a1.title(for: .normal) == s && b2.title(for: .normal) == s && c3.title(for: .normal) == s
                {
                    return true
                }
                if a3.title(for: .normal) == s && b2.title(for: .normal) == s && c1.title(for: .normal) == s
                {
                    return true
                }

                return false // return false if no victory with symbol
              }

      
    
              
              func resultAlert(title: String)
              {
                  let message = "\nNoughts " + String(noughtsScore) + "\n\nCrosses " + String(crossesScore)
                  let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
                  ac.addAction(UIAlertAction(title: "New round", style: .default, handler: { (_) in
                      self.resetBoard()
                  }))
                  self.present(ac, animated: true)
              }
              
      
              func resetBoard()
              {
                  for button in board
                  {
                      button.setTitle(nil, for: .normal)
                      button.isEnabled = true
                  }
                  if firstTurn == Turn.Nought
                  {
                      firstTurn = Turn.Cross
                      turnLb.text = CROSS
                  }
                  else if firstTurn == Turn.Cross
                  {
                      firstTurn = Turn.Nought
                      turnLb.text = NOUGHT
                  }
                  currentTurn = firstTurn
              }
              
              func fullBoard() -> Bool
              {
                  for button in board
                  {
                      if button.title(for: .normal) == nil
                      {
                          return false
                      }
                  }
                  return true
              }
              
              func addToBoard(_ sender: UIButton)
              {
                  if(sender.title(for: .normal) == nil)
                  {
                      if(currentTurn == Turn.Nought)
                      {
                          sender.setTitle(NOUGHT, for: .normal)
                          currentTurn = Turn.Cross
                          turnLb.text = CROSS
                      }
                      else if(currentTurn == Turn.Cross)
                      {
                          sender.setTitle(CROSS, for: .normal)
                          currentTurn = Turn.Nought
                          turnLb.text = NOUGHT
                      }
                      sender.isEnabled = false
                  }
              }
    
    
              
          }


