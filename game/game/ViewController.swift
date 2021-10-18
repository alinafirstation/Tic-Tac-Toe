//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Алина on 05.10.2021.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1
    var gameOver = false
    var gameState = [[0, 0, 0], [0, 0, 0], [0, 0, 0]] //состояние игры (статус ячеек)

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var firstCellOutlet: UIButton!
    @IBOutlet weak var secondCellOutlet: UIButton!
    @IBOutlet weak var thirdCellOutlet: UIButton!
    @IBOutlet weak var fourthCellOutlet: UIButton!
    @IBOutlet weak var fifthCellOutlet: UIButton!
    @IBOutlet weak var sixthCellOutlet: UIButton!
    @IBOutlet weak var seventhCellOutlet: UIButton!
    @IBOutlet weak var eighthCellOutlet: UIButton!
    @IBOutlet weak var ninethCellOutlet: UIButton!
    
    @IBAction func firstCell(_ sender: AnyObject) {
        if gameState[0][0] == 0 {
            gameState[0][0] = activePlayer
            checkCell(sender: sender)
        }
    }
    @IBAction func secondCell(_ sender: AnyObject) {
        if gameState[0][1] == 0 {
            gameState[0][1] = activePlayer
            checkCell(sender: sender)
        }
    }
    @IBAction func thirdCell(_ sender: AnyObject) {
        if gameState[0][2] == 0 {
            gameState[0][2] = activePlayer
            checkCell(sender: sender)
        }
    }
    @IBAction func fourthCell(_ sender: AnyObject) {
        if gameState[1][0] == 0 {
            gameState[1][0] = activePlayer
            checkCell(sender: sender)
        }
    }
    @IBAction func fifthCell(_ sender: AnyObject) {
        if gameState[1][1] == 0 {
            gameState[1][1] = activePlayer
            checkCell(sender: sender)
        }
    }
    @IBAction func sixthCell(_ sender: AnyObject) {
        if gameState[1][2] == 0 {
            gameState[1][2] = activePlayer
            checkCell(sender: sender)
        }
    }
    @IBAction func seventhCell(_ sender: AnyObject) {
        if gameState[2][0] == 0 {
            gameState[2][0] = activePlayer
            checkCell(sender: sender)
        }
    }
    @IBAction func eighthCell(_ sender: AnyObject) {
        if gameState[2][1] == 0 {
            gameState[2][1] = activePlayer
            checkCell(sender: sender)
        }
    }
    @IBAction func ninethCell(_ sender: AnyObject) {
        if gameState[2][2] == 0 {
            gameState[2][2] = activePlayer
            checkCell(sender: sender)
        }
    }
    
    private func checkCell(sender: AnyObject) {
        if (activePlayer == 1) {
            sender.setImage(UIImage(named: "Cross"), for: UIControl.State())
            activePlayer = 2
        }
        else {
            sender.setImage(UIImage(named: "Nought"), for: UIControl.State())
            activePlayer = 1
        }
        checkResult()
    }
    
    private func detectWinner(winner: Int) {
        switch winner {
        case 1:
            label.text = "Cross was won!"
        default:
            label.text = "Nought was won!"
        }
        playAgainButton.isHidden = false
        label.isHidden = false
        
        firstCellOutlet.isEnabled = false
        secondCellOutlet.isEnabled = false
        thirdCellOutlet.isEnabled = false
        fourthCellOutlet.isEnabled = false
        fifthCellOutlet.isEnabled = false
        sixthCellOutlet.isEnabled = false
        seventhCellOutlet.isEnabled = false
        eighthCellOutlet.isEnabled = false
        ninethCellOutlet.isEnabled = false
    }
    
    private func checkResult() {
        for i in 0...2 {
            gameOver = true
            for j in 0...2 {
                if gameState[i][j] != gameState[i][0] { //проверка для строк
                    gameOver = false
                }
            }
            if gameOver && gameState[i][0] != 0 {
                detectWinner(winner: gameState[i][0])
            }
        }
        
        for i in 0...2 {
            gameOver = true
            for j in 0...2 {
                if gameState[j][i] != gameState[0][i] { //проверка для столбцов
                    gameOver = false
                }
            }
                if gameOver && gameState[0][i] != 0 {
                    detectWinner(winner: gameState[0][i])
                }
        }
        
        gameOver = true
        for i in 0...2 {
            if gameState[i][i] != gameState[0][0] { //проверка для 1-ой диагонали
                gameOver = false
            }
        }
        if gameOver && gameState[0][0] != 0 {
            detectWinner(winner: gameState[0][0])
        }
        
        gameOver = true
        for i in 0...2 {
            if gameState[i][2-i] != gameState[0][2] { //проверка для 2-ой диагонали
                gameOver = false
            }
        }
        if gameOver && gameState[0][2] != 0 {
            detectWinner(winner: gameState[0][2])
        }
        
        gameOver = true
        for i in 0...2 {
            for j in 0...2 {
                if gameState[i][j] == 0 {
                    gameOver = false
                }
            }
        }
        if gameOver {
            label.text = "It was a draw!"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        activePlayer = 1
        gameOver = false
        gameState = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
        firstCellOutlet.isEnabled = true
        secondCellOutlet.isEnabled = true
        thirdCellOutlet.isEnabled = true
        fourthCellOutlet.isEnabled = true
        fifthCellOutlet.isEnabled = true
        sixthCellOutlet.isEnabled = true
        seventhCellOutlet.isEnabled = true
        eighthCellOutlet.isEnabled = true
        ninethCellOutlet.isEnabled = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

