//
//  ParseJson.swift
//  Tasks
//
//  Created by Ivan Konishchev on 26.08.2022.
//

import Foundation

final class ParseJsonResult: Parsers {
    var nextParsers: Parsers?
    let decoder = JSONDecoder()
    func parseJson(_ data: Data) {
        if let jsonParse = try? decoder.decode(JsonParseResult.self, from: data) {
            print(jsonParse.result)
            
        } else {
            self.nextParsers?.parseJson(data)
        }
    }
}

final class ParseJsonData: Parsers {
    var nextParsers: Parsers?
    let decoder = JSONDecoder()
    func parseJson(_ data: Data) {
        if let jsonParse = try? decoder.decode(JsonParseData.self, from: data) {
            print(jsonParse.data)
            
        } else {
            self.nextParsers?.parseJson(data)
        }
    }
}

final class ParseJson: Parsers {
    var nextParsers: Parsers?
    let decoder = JSONDecoder()
    func parseJson(_ data: Data) {
        if let jsonParse = try? JSONSerialization.jsonObject(with: data) {
            print(jsonParse)
        } else {
            print("Error parsers")
        }
       
    }
}
