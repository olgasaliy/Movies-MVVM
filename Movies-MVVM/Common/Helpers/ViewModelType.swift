//
//  ViewModelType.swift
//  Movies-MVVM
//
//  Created by Olga Saliy on 9/25/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
