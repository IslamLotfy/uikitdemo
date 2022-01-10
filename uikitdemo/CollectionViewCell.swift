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
        let url = URL(string: moviePosterPath)

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
                self.moviePoster.image = UIImage(data: data!)
            }
        }
    }
}
