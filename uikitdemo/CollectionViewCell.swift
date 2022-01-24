//
//  CollectionViewCell.swift
//  uikitdemo
//
//  Created by Islam Lotfy on 10/01/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieNameTV: UITextField!
    @IBOutlet weak var moviePoster: UIImageView!
    func configure(movieModel: Results){
        self.movieNameTV.text = movieModel.title
        let path = movieModel.backdrop_path
        let url = URL(string:  "https://image.tmdb.org/t/p/w500/\(path ?? "")")
        DispatchQueue.global().async {
            if (url != nil) {
                let data = try? Data(contentsOf: url!)
                if(data != nil){
                    DispatchQueue.main.async {
                        self.moviePoster.image = UIImage(data: data!)

                    }
                } else {
                    self.moviePoster.image = UIImage(systemName: "movies")
                }
            }else {

            }
        }
    }
}
