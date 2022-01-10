//
//  ViewController.swift
//  uikitdemo
//
//  Created by Islam Lotfy on 23/12/2021.
//

import UIKit

class ViewController: UICollectionViewController {
    let dataSource: [String] = ["https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
                                "https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell{
            movieCell.configure(moviePosterPath: dataSource[indexPath.row])
            cell = movieCell
        }
        
        
        return cell
    }
}

