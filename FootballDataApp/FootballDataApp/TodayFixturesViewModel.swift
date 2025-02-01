//
//  TodayFixturesViewModel.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 2/1/25.
//

import Foundation
protocol TodayFixturesViewModelDelegate: AnyObject {
    func didReceiveTodayFixturessResponse(response: TodayMatchesResponse?, statusCode: Int)
}
class TodayFixturesViewModel {
    weak var delegate: TodayFixturesViewModelDelegate?
    func getTodayFixtures() {
        let resource =  TodayFixturesResource()
        resource.getResponse() { result, statusCode in
            switch statusCode {
            case 200, 201, 400, 401:
                DispatchQueue.main.async {
                    self.delegate?.didReceiveTodayFixturessResponse(response: result, statusCode: statusCode)
                }
            case 404, 500, 502:
                DispatchQueue.main.async {
                    self.delegate?.didReceiveTodayFixturessResponse(response: result, statusCode: statusCode)
                }
            default:
                break
            }
        }
        
    }
}
