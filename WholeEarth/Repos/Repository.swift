//
//  Repository.swift
//  WholeEarth
//
//  Created by sotaTek on 01/05/2021.
//

import Foundation
import Networking

public protocol Repository {
  
  associatedtype T
  func getRemoteDataSource(responseCallback: @escaping (Result<T, APIErrors>) -> Void)
}
