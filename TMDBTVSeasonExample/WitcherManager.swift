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
    
    let url = "https://api.themoviedb.org/3/tv/71912/season/1/episode/3?api_key=c281c6340f1417f667c6239240196cbf&language=ko"
    func callRequest() {
        AF.request(url).validate()
            .responseDecodable(of: <#T##Decodable.Protocol#>) { <#DataResponse<Decodable, AFError>#> in
                <#code#>
            }
    }
    
}
