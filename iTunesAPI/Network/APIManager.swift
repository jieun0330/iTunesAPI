//
//  APIManaget.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

final class APIManager {
    static let shared = APIManager()
    
    func callRequest(query: String) -> Observable<MainItunes> {
        
        return Observable<MainItunes>.create { observer in
            
            let url = "https://itunes.apple.com/search?term=\(query)&country=KR&callback=wsSearchCB&media=software"
            
            AF
                .request(url)
                .responseDecodable(of: InfoItunes.self) { response in
                    switch response.result {
                    case .success(let success):
                        print(success)
                    case .failure(let failure):
                        print(failure)
                    }
                }
        }
    }
}
