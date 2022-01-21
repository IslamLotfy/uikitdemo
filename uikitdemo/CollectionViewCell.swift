//
//  CollectionViewCell.swift
//  uikitdemo
//
//  Created by Islam Lotfy on 10/01/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moviePoster: UIImageView!
    func configure(moviePosterPath:String){
        let url = URL(string:  "https://image.tmdb.org/t/p/w500/\(moviePosterPath)")
        print("https://image.tmdb.org/t/p/w500/\(moviePosterPath)")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.moviePoster.image = UIImage(data: data!)
            }
        }
    }
}
