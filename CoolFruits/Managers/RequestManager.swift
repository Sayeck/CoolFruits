//
//  RequestManager.swift
//  CoolFruits
//
//  Created by Luis Alejandro Zapata Gonzalez on 21-07-22.
//

import Foundation
import Combine

enum Endpoint {
    case fruits
    
    var description: String {
        switch self {
        case .fruits:
            return "/all"
        }
    }
}

class RequestManager {
    
    static var shared: RequestManager = {
        let instance = RequestManager()
        
        return instance
    }()
    
    // MARK: Private properties
    
    private var cancellable: AnyCancellable?
    private let environment: Environment!
    
    // MARK: Life cycle
    
    /// The Singleton's initializer should always be private to prevent direct construction calls
    private init() {
        let environmentFactory = EnvironmentFactory()
        environment = environmentFactory.create(.dev)
    }
    
    // MARK: Public properties
    
    typealias RequestCompletion<T: Decodable> = (Result<T, NetworkError>) -> Void
    
    // MARK: Public methods
    
    func execute<T: Decodable>(
        endpoint: Endpoint,
        objectType: T.Type,
        completion: @escaping RequestCompletion<T>
    ) {
        guard let url = URL(string: "\(environment.server)\(endpoint.description)") else {
            completion(.failure(.badURLError))
            return
        }
        
        let urlSession = URLSession.shared
        
        cancellable = urlSession.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main, options: nil)
            .sink(receiveCompletion: { completionHandler in
                switch completionHandler {
                case .finished:
                    break
                case .failure(let error):
                    completion(.failure(.customError(error.localizedDescription)))
                }
            }, receiveValue: { data in
                completion(.success(data))
            })
    }
    
}
