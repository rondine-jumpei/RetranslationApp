//
//  TranslateViewModel.swift
//  RetranslationApp
//
//  Created by ろーんでぃね on 2021/03/14.
//

import Foundation
import RxCocoa
import RxSwift

protocol TranslateViewModelInputs {
    var inputTextViewInput: AnyObserver<String>{ get }
}

protocol TranslateViewModelOutputs {
    var inputTextViewOutput: PublishSubject<String>{ get }
}

class TranslateViewModel: TranslateViewModelInputs, TranslateViewModelOutputs {
    private let disposeBag = DisposeBag()
    
    //    observable（出口）
    var inputTextViewOutput = PublishSubject<String>()
    var validTranslateSubject = BehaviorSubject<Bool>(value: false)
    
    //    observer(入口）
    var inputTextViewInput: AnyObserver<String> {
        inputTextViewOutput.asObserver()
    }
    var validTranslateDriver: Driver<Bool> = Driver.never()
    
    init() {
        validTranslateDriver = validTranslateSubject.asDriver(onErrorDriveWith: Driver.empty())
        
        let inputTextViewValid = inputTextViewOutput.asObservable().map { (text) -> Bool in
            return text.count > 0
        }
        
        inputTextViewValid.asObservable().subscribe { (valid) in
            self.validTranslateSubject.onNext(valid)
        } .disposed(by: disposeBag)

        
    }
}
