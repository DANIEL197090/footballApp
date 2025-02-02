//
//  TeamsResource.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import Foundation
struct TeamsResource {
    func getResponse(competitionCode: String, completionHandler: @escaping (_ result: TeamsResponse?,_ statusCode: Int) -> Void) {
        let endPoint = AppEndpoints.competitionEndPoint + "/\(competitionCode)/teams"
        let authURL = URL(string: endPoint)!
        let httpUtility = HTTPUtility()
        do {
            httpUtility.makeRequestWithParameters(httpMethodType: HtppMethod.GET.rawValue, requestUrl: authURL, resultType: TeamsResponse.self) { apiResponse, statusCode in
                completionHandler(apiResponse,statusCode)
            }
        }
    }
}
