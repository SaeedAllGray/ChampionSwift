//
//  MatchStatus.swift
//  ChampionSwift
//
//  Created by saeed on 8/14/21.
//

import Foundation

enum MatchStatus: String {
   
    case timeToBeDefined = "TBD"
    case notStarted = "NS"
    case firstHalf = "1H"
    case halfTime = "HT"
    case secondHalf = "2H"
    case extraTime = "ET"
    case penaltyInProgress = "P"
    case matchFinished = "FT"
    case matchFinishedAfterExtraTime = "AET"
    case breakTime = "BT"
    
    case inProgress = "LIVE"
    
}
