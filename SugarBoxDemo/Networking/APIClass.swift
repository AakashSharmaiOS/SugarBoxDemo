//
//  APIClass.swift
//  SugarBoxDemo
//
//  Created by IOSTEAM02 on 23/11/23.
//

import Foundation

class APIClass {
    
    func CallAPI(_ completion: @escaping (Data?, Error?) ->()){
        let Url = String(format: "https://apigw.sboxdc.com/ecm/v2/super/feeds/zee5-home/details?page=1&perPage=20")
        guard let serviceUrl = URL(string: Url) else { return }
        
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                completion(data, nil)
            }else {
                print(error! as NSError)
                completion(nil, error)
            }
        }.resume()
    }
    
}
