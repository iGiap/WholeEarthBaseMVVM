//
//  HomeViewModel.swift
//  WholeEarth
//
//  Created by sotaTek on 02/05/2021.
//

import Foundation
import Networking

class HomeViewModel {
  
  private let homeInteractor: HomeInteractor
  private let homeRepository: HomeRepository
  
  var tvShowContainer: TVShowContainer? {
    didSet {
      updateCellViewModels()
      homeInteractor.shouldUpdateTableView()
    }
  }
  
  var listCellViewModel: [HomeCellViewModel] = []

  // Init
  init(interactor: HomeInteractor) {
    self.homeInteractor = interactor
    let request = Requestable(path: HomeEndpoint.trendingShow(timeWindow: "day").provideUrl(), parameters: [Constants.Parameters.api_key : Constants.tmdbApiKey], method: .get)
    self.homeRepository = HomeRepository(requestConfigurator: request)
  }
  
  func fetchDataTvShow() {
    homeRepository.getRemoteDataSource { [weak self] result in
      guard let strongSelf = self else { return }
      switch result {
      case .success(let tvShow):
        strongSelf.tvShowContainer = tvShow
      case .error(let error):
        print(error)
      }
    }
  }
  
  // Implement
  func updateCellViewModels() {
      let tvShows = tvShowContainer?.results ?? []
      for tvShow in tvShows {
        listCellViewModel.append(HomeCellViewModel(tvShow: tvShow))
      }
  }
  
  
}
