//
//  Crypto.swift
//  HW10
//
//  Created by Anton Duplin on 25/9/21.
//

import Foundation
struct Crypto: Decodable {
    var data: [Data]
    var info: Info
   
}

struct Data: Decodable {
    let id: String?
    let symbol: String?
    let name: String?
    let nameid: String?
    let rank: Int?
    let price_usd: String?
    let percent_change_24h: String?
    let percent_change_1h: String?
    let percent_change_7d: String?
    let price_btc: String?
    let market_cap_usd: String?
    let volume24: Double?
    let volume24a: Double?
    let csupply: String?
    let tsupply: String?
    let msupply: String?
    
}

struct Info: Decodable {
    var coins_num: Int?
    var time: Int?
}


enum URLS: String {
    case CryptoJson = "https://api.coinlore.net/api/tickers/"
}

