//
//  ClubModel.swift
//  DicodingSport
//
//  Created by Pratama Yoga on 12/06/21.
//

import Foundation

struct ClubModel: Codable {
    
    var idTeam: String
    var strTeam: String
    var strTeamBadge: String
    var strStadium: String
    var strStadiumThumb: String
    var strKeywords: String
    var strDescriptionEN: String
    var strTeamJersey: String
    
    init(teamID: String, teamName: String, teamBadge: String, stadiumName: String,stadiumImage: String,teamSlogan: String,teamDescription: String, teamJersey: String) {
            self.idTeam = teamID
            self.strTeam = teamName
            self.strTeamBadge = teamBadge
            self.strStadium = stadiumName
            self.strStadiumThumb = stadiumImage
            self.strKeywords = teamSlogan
            self.strDescriptionEN = teamDescription
            self.strTeamJersey = teamJersey
        }
}
