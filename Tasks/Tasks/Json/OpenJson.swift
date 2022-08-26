//
//  OpenJson.swift
//  Tasks
//
//  Created by Ivan Konishchev on 26.08.2022.
//

import Foundation

final class OpenJson {
    
    func data(from file: String) -> Data {
        let path1 = Bundle.main.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path1)
        let data = try! Data(contentsOf: url)
        return data
    }

}
