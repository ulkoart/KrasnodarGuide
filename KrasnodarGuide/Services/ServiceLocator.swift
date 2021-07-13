//
//  ServiceLocator.swift
//  KrasnodarGuide
//
//  Created by user on 11.06.2021.
//

import Foundation

protocol Serviceable {}

final class ServiceLocator {
    
    private var registry = [ObjectIdentifier: Any]()
    static var shared: ServiceLocator = .init() // shared
    
    private init() {
        registerFirstServices()
    }
    
    // MARK: - Declaration
    func registerFirstServices() {
        // Initialization
        registerSingleton(singletonInstance: Router())
        register(factory: { Locations() })
        
    }
    
    // MARK: - Registration
    func register<Service>(factory: @escaping () -> Service) {
        let serviceId = ObjectIdentifier(Service.self)
        registry[serviceId] = factory
    }
    
    func registerSingleton<Service>(singletonInstance: Service) {
        let serviceId = ObjectIdentifier(Service.self)
        registry[serviceId] = singletonInstance
    }
    
    // MARK: - Injection
    func inject<Service>() -> Service {
        let serviceId = ObjectIdentifier(Service.self)
        if let factory = registry[serviceId] as? () -> Service {
            return factory()
        } else if let singletonInstance = registry[serviceId] as? Service {
            return singletonInstance
        } else {
            fatalError("No registered entry for \(Service.self)")
        }
    }
    
}

