//
//  HomeTableViewCell.swift
//  WholeEarth
//
//  Created by sotaTek on 02/05/2021.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
  @IBOutlet weak var imageViewFilm: UIImageView!
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var rating: UILabel!
  @IBOutlet weak var overview: UILabel!
  
  var homeCellViewModel: HomeCellViewModel? {
    didSet {
      updateCell()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }

  func updateCell() {
    title.text = homeCellViewModel?.tvShow.name
    rating.text = "\(homeCellViewModel?.tvShow.voteAverage ?? 0)"
    overview.text = homeCellViewModel?.tvShow.overview
    let imageURL = HomeEndpoint.image(width: String(500), posterPath: homeCellViewModel?.tvShow.posterPath ?? "").provideUrl()
    imageViewFilm.kf.setImage(with: URL(string: imageURL))
    imageViewFilm.kf.indicatorType = .activity
    
  }
  
}
