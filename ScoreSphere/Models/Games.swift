//
//  Game.swift
//  ScoreSphere
//
//  Created by macbook pro on 20.05.2023.
//

import Foundation

struct Games: Codable {
    var games: [Game]?
}

struct Game: Codable {
    var name: String?
}
