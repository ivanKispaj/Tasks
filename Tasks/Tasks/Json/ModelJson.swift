//
//  ModelJson.swift
//  Tasks
//
//  Created by Ivan Konishchev on 26.08.2022.
//

import Foundation
protocol Parsers {
    var nextParsers: Parsers? { get set }
    func parseJson(_ data: Data)
}
struct JsonParse: Decodable {
    var name: String
    var age: Int
    var isDeveloper: Bool
}


struct JsonParseData: Decodable {
    var data: [JsonParse]
    
}

struct JsonParseResult: Decodable {
    var result: [JsonParse]
}

