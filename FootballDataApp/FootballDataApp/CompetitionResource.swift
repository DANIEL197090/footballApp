//
//  CompetitionResource.swift
//  FootballDataApp
//
//  Created by mac on 1/31/25.
//

import Foundation
import Foundation
struct CompetitionsResource {
    func getResponse(completionHandler: @escaping (_ result: CompetitionsResponse?,_ statusCode: Int) -> Void) {
        let endPoint = AppEndpoints.competitionEndPoint
        debugPrint(">>>>\(endPoint)")
        let authURL = URL(string: endPoint)!
        let httpUtility = HTTPUtility()
        do {
            httpUtility.makeRequestWithParameters(httpMethodType: HtppMethod.GET.rawValue, requestUrl: authURL, resultType: CompetitionsResponse.self) { apiResponse, statusCode in
                completionHandler(apiResponse,statusCode)
                debugPrint("000\(statusCode)")
                debugPrint("000\(apiResponse)")
            }
        }
    }
}
