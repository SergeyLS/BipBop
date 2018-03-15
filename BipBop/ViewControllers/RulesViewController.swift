//
//  RulesViewController.swift
//  BipBop
//
//  Created by Sergey Leskov on 3/15/18.
//  Copyright © 2018 Sergey Leskov. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {

    
    @IBOutlet weak var rulesUI: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        rulesUI.text = "The exercise is based on a popular mental math game. Children usually sit around a table, first player says '1', and each next player counts up. The numbers which are divisible by either 3 or 5 are replaced with the corresponding word, in our case 'Bip' and 'Bop'. If the number is divisible by both numbers, it becomes 'Bip Bop'. If a player makes a mistake, or takes too long, they are eliminated from the game.\n\n This app generates a correct game sequence for selected numbers."
        */
        
        rulesUI.text = "Упражнение основано на популярной умственной математической игре. Дети обычно сидят за столом, первый игрок говорит «1», и каждый следующий игрок подсчитывает. Числа, которые делятся на 3 или 5, заменяются соответствующим словом, в нашем случае «Bip» и «Bop». Если число делится на оба числа, оно становится «Bip Bop». Если игрок совершает ошибку или думает слишком много времени, он исключаются из игры. \n\nЭто приложение генерирует правильную последовательность игр для выбранных номеров."
        
    }


}
