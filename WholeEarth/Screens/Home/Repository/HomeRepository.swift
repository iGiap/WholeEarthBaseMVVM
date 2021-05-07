//
//  HomeRepository.swift
//  WholeEarth
//
//  Created by sotaTek on 02/05/2021.
//

import Foundation
import Networking

class HomeRepository: Repository {
  func getRemoteDataSource(responseCallback: @escaping (Result<TVShowContainer?, APIErrors>) -> Void) {
    APIRequest.request(APIRouter(requestable: requestConfigurator), completion: responseCallback)
  }
  
  typealias T = TVShowContainer?
  
  private var requestConfigurator: Requestable
  
  init(requestConfigurator: Requestable) {
    self.requestConfigurator = requestConfigurator
  }
}
