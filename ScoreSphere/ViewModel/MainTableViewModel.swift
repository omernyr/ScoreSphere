//
//  MainTableViewModel.swift
//  ScoreSphere
//
//  Created by macbook pro on 20.05.2023.
//

import Foundation
import UIKit

class MainTableViewModel {
    
    var game: Game = Game(name: "")
    var games: [Game] = []
    
    func appendElement() {
        games.append(game)
    }
}
