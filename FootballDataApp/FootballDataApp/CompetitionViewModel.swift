//
//  CompetitionViewModel.swift
//  FootballDataApp
//
//  Created by mac on 1/31/25.
//

import Foundation
protocol CompetitionsViewModelDelegate: AnyObject {
    func didReceiveCompetitionsResponse(response: CompetitionsResponse??, statusCode: Int)
}
class  CompetitionsViewModel {
    weak var delegate:  CompetitionsViewModelDelegate?
    func getAllSubscriptionHistory() {
        let resource =  CompetitionsResource()
        resource.getResponse() { result, statusCode in
            switch statusCode {
            case 200, 201, 400, 401:
                DispatchQueue.main.async {
                    self.delegate?.didReceiveCompetitionsResponse(response: result, statusCode: statusCode)
                }
            case 404, 500, 502:
                DispatchQueue.main.async {
                    self.delegate?.didReceiveCompetitionsResponse(response: result, statusCode: statusCode)
                }
            default:
                break
            }
        }
        
    }
}
