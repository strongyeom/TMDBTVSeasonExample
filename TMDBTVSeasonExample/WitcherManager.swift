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
       
//        let url = "https://api.themoviedb.org/3/tv/71912/season/\(season)/episode/\(episode)?api_key=\(APIKey.tmdbKey)&language=ko"
        
        var components = URLComponents(string: "https://api.themoviedb.org/3/tv/71912/season/\(season)/episode/\(episode)")!
        let apiKey = URLQueryItem(name: "api_key", value: "\(APIKey.tmdbKey)")
        let language = URLQueryItem(name: "language", value: "ko")
        components.queryItems = [apiKey, language]
        let url = components.url!
        
        
        let urlaa = "https://api.themoviedb.org/3/tv/71912/season/\(season)/episode/\(episode)?api_key=\(APIKey.tmdbKey)&language=ko"
        let componentsaa = URLComponents(string: urlaa)

        componentsaa?.scheme // https
        componentsaa?.host   // api.themoviedb.org
        componentsaa?.path   // 3/tv/71912/season/\(season)/episode/\(episode)
        componentsaa?.query  // api_key=\(APIKey.tmdbKey)&language=ko
        
        AF.request(url).validate()
            .responseDecodable(of: WitcherEpisode.self) { response in
                guard let response = response.value else { return }
                completionHandler(response)
            }
        
 
    }
}
