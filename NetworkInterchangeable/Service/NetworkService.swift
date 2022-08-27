//
//  NetworkService.swift
//  NetworkInterchangeable
//
//  Created by Yigit Ozdamar on 27.08.2022.
//

import Foundation

protocol NetworkService {
    
    func download(_ resource : String) async throws -> [User]
    
    var type : String { get  }
}
