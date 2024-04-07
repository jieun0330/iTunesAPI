//
//  SearchViewModel.swift
//  iTunesAPI
//
//  Created by 박지은 on 4/7/24.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {
    
    private let disposeBag = DisposeBag()
    
    struct Input {
        let searchButtonTap: ControlEvent<Void>
        let searchText: ControlProperty<String>
    }
    
    struct Output {
        let itunesInfo: PublishSubject<[InfoItunes]>
    }
    
    func transform(input: Input) -> Output {
        
        let iTunesList = PublishSubject<[InfoItunes]>()
                
        input.searchButtonTap
            .throttle(.seconds(1),
                      scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchText)
            .distinctUntilChanged()
            .flatMap {
                APIManager.shared.callRequest(query: $0)
            }
            .subscribe(with: self) { owner, value in
                iTunesList.onNext(value)
            }
            .disposed(by: disposeBag)
        
        return Output(itunesInfo: iTunesList)
    }
}
