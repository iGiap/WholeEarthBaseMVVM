//
//  HomeViewController.swift
//  WholeEarth
//
//  Created by sotaTek on 01/05/2021.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {
  @IBOutlet weak var tableView: UITableView!
  
  // View Model
  var viewModel: HomeViewModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    viewModel = HomeViewModel(interactor: self)
    configGUI()
  }
  
  // Load Data
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel.fetchDataTvShow()
  }

  func configGUI() {
    // Config table view
    tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
  }

}

extension HomeViewController: HomeInteractor {
  func shouldUpdateTableView() {
    tableView.reloadData()
  }
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.listCellViewModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as? HomeTableViewCell else {
      return UITableViewCell()
    }
    
    cell.homeCellViewModel = viewModel.listCellViewModel[indexPath.row]
    return cell
  }
  
}
