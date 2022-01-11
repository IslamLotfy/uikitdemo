//
//  ViewController.swift
//  uikitdemo
//
//  Created by Islam Lotfy on 23/12/2021.
//

import UIKit

class ViewController: UICollectionViewController {
    let url : String = "https://api.themoviedb.org/3/movie/popular?api_key=e20080ab8b395f936423b819c9b6b689&language=en-US"
    var dataSource: [String] = ["https://image.tmdb.org/t/p/w500//1Rr5SrvHxMXHu5RjKpaMba8VTzi.jpg",
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
        getData(from: url)
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
    
    private func getData(from url: String){
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error -> Void in
            guard let data = data, error == nil else {
                print("some thing went wrong")
                return
            }
            var result: Response?
            do{
                result = try JSONDecoder().decode(Response.self, from: data)
            } catch{
                print("some thing went wrong in parsing")
            }
            guard let movies = result else {
                return
            }
            print(movies.self.results.count)

            self.dataSource = movies.self.results.map({$0.backdropPath})
            self.collectionView.reloadData()
        }).resume()
        
    }
}

