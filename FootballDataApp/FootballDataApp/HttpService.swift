//
//  HttpService.swift
//  FootballDataApp
//
//  Created by Ifeanyi Mbata on 1/31/25.
//

import Foundation
struct HTTPUtility {
    func makeRequestWithParameters<T: Decodable>(httpMethodType: String, requestUrl: URL, resultType: T.Type, completion:@escaping(_ result: T?,_ statusCode:Int)-> Void) {
        debugPrint(">>>>\(requestUrl)")
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = httpMethodType
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("150d8440b7de4e8587a9f58dd0e9c5fe", forHTTPHeaderField: "X-Auth-Token")
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse, let data = data {
                do {
                    debugPrint(">>>>\(httpResponse.statusCode)")
                    debugPrint(">>>>\(data)")
                    switch httpResponse.statusCode {
                    case 200, 201, 400, 401:
                        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                        completion(decodedResponse, httpResponse.statusCode)
                    case 404, 500:
                        let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                        completion(decodedResponse, httpResponse.statusCode)
                    case 502:
                        Toast.shared.showToastWithTItle("Request", type: .error)
                        completion(nil, httpResponse.statusCode)
                    default:
                        break
                    }
                } catch {
                    debugPrint("Error decoding response:", error)
                    completion(nil, httpResponse.statusCode)
                }
            } else {
                completion(nil, -1) // Indicate an unknown error
            }
        }.resume()
    }
}
