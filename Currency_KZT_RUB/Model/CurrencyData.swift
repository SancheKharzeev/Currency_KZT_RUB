//
//  CurrencyData.swift
//  Currency_KZT_RUB
//
//  Created by Александр Х on 05.03.2023.
//

import Foundation

struct CurrencyData: Codable {
    let valute: Valute
    let date: String
    
}

struct Valute: Codable {
    let usd: USD
    let kzt: KZT
    let cny: CNY
}
struct KZT: Codable {
    let nominal: Int
    let value: Double
    let previous: Double
}

struct USD: Codable {
    let nominal: Int
    let value: Double
    let previous: Double
}

struct CNY: Codable {
    let nominal: Int
    let value: Double
    let previous: Double
}
