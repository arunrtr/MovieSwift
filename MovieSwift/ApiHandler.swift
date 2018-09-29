//
//  ApiHandler.swift
//  MovieSwift
//
//  Created by Arun Kumar on 9/26/18.
//  Copyright © 2018 Arun Kumar. All rights reserved.
//

import Foundation
import UIKit

struct JSON: Codable{
    var results: [Movie]
}

struct Movie: Codable{
    var title: String
    var popularity: Double
    var release_date: String
    var poster_path: String?
}

class ApiHandler {
    
    var delegate : MoviesListProtocol?
    func getMoviesList (url : String) {
        
        guard let mUrl = URL(string: url), url.count > 0  else{
            return
        }
        URLSession.shared.dataTask(with: mUrl) { (data, response, error) in
            
            if error == nil && data == nil {
                
                DispatchQueue.main.async {
                    self.delegate?.getMoviesListFinished(data: nil)
                }
            }else{
                
                let jsonDecoder = JSONDecoder()
                
                do{
                    let modal = try jsonDecoder.decode(JSON.self, from: data!)
                    print("\(modal)")
                    
                    DispatchQueue.main.async {
                        self.delegate?.getMoviesListFinished(data:modal.results)
                    }

                }catch{
                    print("\(error)")
                    DispatchQueue.main.async {
                        self.delegate?.getMoviesListFinished(data: nil)
                    }
                }
            }
        }.resume()
    }
}



//func getObjects<T: Codable>(withURL urlStr: String, type: T.Type, completionHandler: @escaping (T?, ErrorConstant?)->()) {
//    guard let url = URL(string: urlStr) else {
//        completionHandler(nil, ErrorConstant.wrongUrlError)
//        return
//    }
//    
//    Alamofire.request(url).responseJSON { (response) in
//        guard let data = response.data, data.count > 0 else {
//            log.error(response)
//            completionHandler(nil, ErrorConstant.networkError)
//            return
//        }
//        do {
//            let object = try JSONDecoder().decode(type, from: data)
//            completionHandler(object, nil)
//        }
//        catch {
//            completionHandler(nil, ErrorConstant.decodeError)
//        }
//    }
//}
