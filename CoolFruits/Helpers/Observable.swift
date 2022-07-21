//
//  Observable.swift
//  CoolFruits
//
//  Created by Alejandro Enrique Campos Iriarte on 21/07/22.
//

import Foundation

class Observable<T> {
    
    // MARK: Public properties
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    // MARK: Life cycle
    
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: Private properties
    
    private var observer: ((T) -> Void)?
    
    // MARK: Public methods
    
    func bind(observer: @escaping (T) -> Void) {
        self.observer = observer
    }
    
}
