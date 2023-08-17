//
//  WitcherManager.swift
//  TMDBTVSeasonExample
//
//  Created by 염성필 on 2023/08/17.
//

import Foundation
import Alamofire

class WitcherManager {
    static let shared = WitcherManager()
    private init() {}
    

    
    func callRequest(season: Int, episode: Int, completionHandler: @escaping(WitcherEpisode) -> Void) {
       
        let url = "https://api.themoviedb.org/3/tv/71912/season/\(season)/episode/\(episode)?api_key=\(APIKey.tmdbKey)&language=ko"
        AF.request(url).validate()
            .responseDecodable(of: WitcherEpisode.self) { response in
                guard let response = response.value else { return }
                completionHandler(response)
            }
    }
    
    func callTwoRequest(episode: Int, completionHandler: @escaping(WitcherEpisode) -> Void) {
       
        let url = "https://api.themoviedb.org/3/tv/71912/season/2/episode/\(episode)?api_key=\(APIKey.tmdbKey)&language=ko"
        
        AF.request(url).validate()
            .responseDecodable(of: WitcherEpisode.self) { response in
                guard let response = response.value else { return }
                completionHandler(response)
            }
    }
    
    func callThreeRequest(episode: Int, completionHandler: @escaping(WitcherEpisode) -> Void) {
       
        let url = "https://api.themoviedb.org/3/tv/71912/season/3/episode/\(episode)?api_key=\(APIKey.tmdbKey)&language=ko"
        
        AF.request(url).validate()
            .responseDecodable(of: WitcherEpisode.self) { response in
                guard let response = response.value else { return }
                completionHandler(response)
            }
    }
    
}
