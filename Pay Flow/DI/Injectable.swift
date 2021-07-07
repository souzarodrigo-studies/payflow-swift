//
//  Injectable.swift
//  Pay Flow
//
//  Created by Rodrigo Santos on 04/07/21.
//

import Foundation
import Combine

protocol Injectable {}

@propertyWrapper
struct Inject<T: Injectable> {
    let wrappedValue: T
    
    init() {
        wrappedValue = Resolver.shared.resolve()
    }
}

class Resolver {
    
    private var storage = [String: Injectable]()
    
    static let shared = Resolver()
    private init() {
        
    }
    
    func add<T: Injectable>(_ injectable: T) {
        let key = String(reflecting: injectable)
        storage[key] = injectable
    }
    
    func resolve<T: Injectable>() -> T {
        let key = String(reflecting: T.self)
        
        guard let injectable = storage[key] as? T else {
            fatalError("\(key) has not been added as an injectable object.")
        }
        
        return injectable
    }
    
    
}

class DependencyManager {
    private let myDependency: MyDependency
    
    init() {
        self.myDependency = MyDependency()
        addDependencies()
    }
    
    private func addDependencies() {
        let resolver = Resolver.shared
        resolver.add(myDependency)
    }
}


class MyDependency: Injectable {
    
     var test: String!
    
    func doSomething() {
        test = "Next Level injection published"
        print("Next level injection 💉")
    }
}
