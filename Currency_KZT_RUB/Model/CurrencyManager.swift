//
//  CurrencyList.swift
//  Currency_KZT_RUB
//
//  Created by Александр Х on 05.03.2023.
//

import Foundation

protocol CurrencyManagerDelegate {
    func didUpdateWeather(_ currencyManager: CurrencyManager, currency: CurrencyModel)
    func didFailWithError(error: Error)
}


struct CurrencyManager {
    let currencyURL = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    var delegate: CurrencyManagerDelegate?
    
    
    
    func fetchCurrency(nameCurr: String) { // подготавливаем ссылку для извлечения курса валюты
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        performReques(with: urlString)
    }
    
    func performReques(with urlString: String) { // выполняем запрос
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                   self.parseJSON(safeData)
                    
                }
            }
            task.resume()
            
        }
    }
    
    func parseJSON(_ currencyData: Data)  {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CurrencyData.self, from: currencyData)
            print(decodedData.date)
        } catch {
            print(error)
        }
    }
}
