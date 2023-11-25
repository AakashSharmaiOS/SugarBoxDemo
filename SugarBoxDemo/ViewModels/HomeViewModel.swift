//
//  HomeViewModel.swift
//  SugarBoxDemo
//
//  Created by IOSTEAM02 on 23/11/23.
//

import Foundation

class HomeViewModel {
    
    func getHomeData(completion: @escaping(HomeModel?,Error?) -> ()) {
        APIClass().CallAPI { data, error in
            if error == nil {
                do {
                    let json = try JSONDecoder().decode(HomeModel.self, from: data!)
                    completion(json,nil)
                } catch {
                    print(error)
                    completion(nil,error)
                }
            } else {
                print(error?.localizedDescription ?? "")
            }
        }
    }
    
}
