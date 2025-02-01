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
