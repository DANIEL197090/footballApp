//
//  TodayFixturesResource.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import Foundation
struct TodayFixturesResource {
    func getResponse(completionHandler: @escaping (_ result: TodayMatchesResponse?,_ statusCode: Int) -> Void) {
        let endPoint = AppEndpoints.matchesEndPoint
        let authURL = URL(string: endPoint)!
        let httpUtility = HTTPUtility()
        do {
            httpUtility.makeRequestWithParameters(httpMethodType: HtppMethod.GET.rawValue, requestUrl: authURL, resultType: TodayMatchesResponse.self) { apiResponse, statusCode in
                completionHandler(apiResponse,statusCode)
            }
        }
    }
}
