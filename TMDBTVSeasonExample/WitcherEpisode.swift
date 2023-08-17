//
//  WitcherEpisode.swift
//  TMDBTVSeasonExample
//
//  Created by 염성필 on 2023/08/17.
//

import Foundation

// MARK: - WitcherEpisode
struct WitcherEpisode: Codable {
    let episodeNumber: Int
    let name, overview: String
    let id: Int
    let seasonNumber: Int
    let stillPath: String

    enum CodingKeys: String, CodingKey {
        case episodeNumber = "episode_number"
        case name, overview, id
        case seasonNumber = "season_number"
        case stillPath = "still_path"
    }
}
