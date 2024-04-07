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
    
    func callRequest(query: String) -> Observable<[InfoItunes]> {
        
        return Observable<[InfoItunes]>.create { observer in
            
            let url = "https://itunes.apple.com/search?term=\(query)&country=KR&&entity=software"
            
            AF
                .request(url)
                .responseDecodable(of: MainItunes.self) { response in
                    switch response.result {
                    case .success(let success):
                        print(success)
                        observer.onNext(success.results)
                        observer.onCompleted()
                    case .failure(let failure):
                        dump(failure)
                        observer.onError(failure)
                    }
                }
            return Disposables.create()
        }
    }
}
