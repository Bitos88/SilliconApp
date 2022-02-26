//
//  TvShowDetailViewController.swift
//  SilliconPowerApp
//
//  Created by Alberto Alegre Bravo on 25/2/22.
//

import UIKit

class TvShowDetailViewController: UIViewController {
    
    
    var tvShow: TvShow?
    
    @IBOutlet var detailBackImage: UIImageView!
    
    @IBOutlet var posterImage: UIImageView!
    @IBOutlet var tvShowTitle: UILabel!
    
    @IBOutlet var tvShowVoteCount: UILabel!
    @IBOutlet var firstAirDateTvShow: UILabel!
    @IBOutlet var tvShowOverview: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailBackImage.load(urlString: "https://image.tmdb.org/t/p/w500\(tvShow?.backdropPath ?? "")")
        
        posterImage.load(urlString: "https://image.tmdb.org/t/p/w500\(tvShow?.posterPath ?? "")")
        tvShowTitle.text = tvShow?.name
        
        tvShowVoteCount.text = "Rate: \(String(describing: tvShow?.voteCount))"
        firstAirDateTvShow.text = tvShow?.firstAirDate
        tvShowOverview.text = tvShow?.overview
    }
    

}
