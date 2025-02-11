//
//  HelperFunctions.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import Foundation
enum HtppMethod: String {
    case POST = "POST"
    case GET = "GET"
    case DELETE = "DELETE"
    case PUT = "PUT"
}
func showNoInternetConnection() -> String {
    return "Please check your internet connection and try again."
}
func showNoInternetConnectionHeader() -> String {
    return "No Internet Connection"
}

let appLeadingConstraint = CGFloat(20)
let appTrailingConstraint = CGFloat(-20)

func extractTime(from utcDate: String) -> String? {
    let dateFormatter = ISO8601DateFormatter()
    dateFormatter.formatOptions = [.withInternetDateTime]
    
    if let date = dateFormatter.date(from: utcDate) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        timeFormatter.timeZone = TimeZone(identifier: "UTC") // Ensure it's in UTC
        return timeFormatter.string(from: date)
    }
    return nil
}
