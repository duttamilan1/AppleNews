//
//  NewsAPIResponse.swift
//  Apple News
//
//  Created by Milan Dutta on 11/12/22.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
