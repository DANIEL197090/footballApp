//
//  CompetitionsDataResource.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import Foundation
struct CompetitionsStandingsResource {
    func getResponse(competitionName: String, completionHandler: @escaping (_ result: StandingsResponse?,_ statusCode: Int) -> Void) {
        let endPoint = AppEndpoints.competitionEndPoint + "/\(competitionName)/standings"
        debugPrint(">>>>\(endPoint)")
        let authURL = URL(string: endPoint)!
        let httpUtility = HTTPUtility()
        do {
            httpUtility.makeRequestWithParameters(httpMethodType: HtppMethod.GET.rawValue, requestUrl: authURL, resultType: StandingsResponse.self) { apiResponse, statusCode in
                completionHandler(apiResponse,statusCode)
                debugPrint("000\(statusCode)")
                debugPrint("000\(apiResponse)")
            }
        }
    }
}
