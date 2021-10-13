//
//  Ricky.swift
//  HW10
//
//  Created by Anton Duplin on 25/9/21.
//

import Foundation
struct Characters: Decodable {
    let info: Info
    let result : Result
}

struct Locations: Decodable {
    let info: Info
    let result: Result

}

struct Episodes: Decodable {
    let info: Info
    let result: Result
}

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
}

struct Result: Decodable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Origin
    let location: Origin
    let image: String
    let episode: [String]
    let url: String
    let dimension: String
    let residents: [String]
    let characters: [String]
}

struct Origin : Decodable {
    let ricky: [Result?]
    let name: String
    let url: String
}


