//
//  ClubProvider.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 12/06/21.
//

import Foundation

class ClubProvider: ObservableObject{
    
    func getAllData(completion: @escaping ([ClubModel]) -> ()) {
        guard let uri = URL(string: "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?l=English%20Premier%20League") else { return };
        
        URLSession.shared.dataTask(with: uri){(data, _, _) in
            let clubs = try! JSONDecoder().decode([String:[ClubModel]].self, from: data!)
            
            DispatchQueue.main.async {
                completion(clubs["teams"]!) 
            }
            
        }
        .resume()
    }
}
