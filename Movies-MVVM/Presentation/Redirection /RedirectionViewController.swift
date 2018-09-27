//
//  RedirectionViewController.swift
//  Movies-MVVM
//
//  Created by Olga Saliy on 9/4/18.
//  Copyright © 2018 Olha Salii. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RedirectionViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private var viewModel: RedirectionViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = RedirectionViewModel(ConfigurationDataProvider())
        bind()
    }
    
    private func redirectToMainStoryboard(_ navigate: Bool) {
        guard navigate else {
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "initialController") as UIViewController
        present(vc, animated: true, completion: nil)
    }

}

extension RedirectionViewController: Bindable {
    
    func bind() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .map{ _ in () }
            .asDriver(onErrorJustReturn: ())
        let input = RedirectionViewModel.Input(load: viewWillAppear)
        let output = viewModel.transform(input: input)
        
        output.dataIsReady
            .do(onNext: redirectToMainStoryboard(_:))
            .drive()
            .disposed(by: disposeBag)

    }
    
}
