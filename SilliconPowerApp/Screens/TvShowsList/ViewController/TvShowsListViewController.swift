//
//  TvShowsListViewController.swift
//  SilliconPowerApp
//
//  Created by Alberto Alegre Bravo on 24/2/22.
//

import UIKit

class TvShowsListViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var tvShows: [TvShow] = []
    
    var theMovieDBAPI = TheMovieDBAPI()
    
    
    private var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 10)
        let width = (collectionView.frame.width / 2) - (layout.minimumInteritemSpacing / 2) - layout.sectionInset.left

                
        layout.itemSize = CGSize(width: width, height: 280)
        
        return layout
    }
    
    func navigationConfigure(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector (tappedButton))
    }
    
    @objc func tappedButton() {
        
        theMovieDBAPI.index += 1
        loadTvShows(){
            print(self.tvShows.count)
            self.collectionView.setNeedsLayout()
            self.collectionView.layoutIfNeeded()
        }

        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TV SHOWS"
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(.init(nibName: "TvShowsListCell", bundle: .main), forCellWithReuseIdentifier: "Cell")
        
        navigationConfigure()
        loadTvShows(){ [weak self] in
            self?.collectionView.reloadData()
        }
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension TvShowsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvShows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? TvShowsCollectionViewCell else {fatalError()}
        
        cell.collectionLabel.text = tvShows[indexPath.row].originalName
        cell.collectionImage.setPlaceHolder(placeHolderImg: "IT")
        cell.collectionImage.load(urlString: tvShows[indexPath.row].posterPath ?? "IT")
        
        return cell
        
    }
}

extension TvShowsListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "TvShowDetailViewController", bundle: nil)
        
        guard let TvShowDetailViewController = storyboard.instantiateViewController(withIdentifier: "TvShowDetailViewController") as? TvShowDetailViewController else {return}
        
        TvShowDetailViewController.tvShow = tvShows[indexPath.row]
        
        self.navigationController?.pushViewController(TvShowDetailViewController, animated: true)
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
    }
}

extension TvShowsListViewController {
    
    func loadTvShows(completion: (()->Void)? = nil) {
        theMovieDBAPI.getTvShows { tvShows in
            for tvShow in tvShows {
                self.tvShows.append(tvShow)
            }
            DispatchQueue.main.async {
                completion?()
            }
        }
    }
}
