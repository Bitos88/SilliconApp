//
//  TvShowDetailViewController.swift
//  SilliconPowerApp
//
//  Created by Alberto Alegre Bravo on 25/2/22.
//

import UIKit

class TvShowDetailViewController: UIViewController {
    
    
    var tvShow: TvShow?
    
    
    @IBOutlet var tvShowImage: UIImageView!
    @IBOutlet var tvShowTitle: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tvShowImage.setPlaceHolder(placeHolderImg: "IT")
        tvShowTitle.text = tvShow?.name
    }
    

}
