//
//  RedirectionViewModel.swift
//  Movies-MVVM
//
//  Created by Olga Saliy on 9/25/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RedirectionViewModel: ViewModelType {
    
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        let dataIsReady: Driver<Bool>
    }
    
    private let dataProvider: ConfigurationDataProvider
    
    init(_ dataProvider: ConfigurationDataProvider) {
        self.dataProvider = dataProvider
    }
    
    func transform(input: Input) -> Output {
        let loader = dataProvider.getConfiguration()
            .do(onNext: configurationLoaded(_:))
            .map { _ in true }
            .asDriver(onErrorJustReturn: false)
            .startWith(true)
        return Output(dataIsReady: loader)
    }
    
    private func configurationLoaded(_ config: Configuration) {
        LocalDataStorage.default.imageUrl = config.images.secure_base_url
    }
    
}
