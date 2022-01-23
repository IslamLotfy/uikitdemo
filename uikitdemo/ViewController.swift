//
//  ViewController.swift
//  uikitdemo
//
//  Created by Islam Lotfy on 23/12/2021.
//

import UIKit

class ViewController: UICollectionViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var dataSource: [Results] = []
    var pageNumber = 0
    var url  = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isHidden = true
        loadingIndicator.center = self.view.center
        loadingIndicator.startAnimating()
        self.loadingIndicator.isHidden = false
        loadMoreData()
        //        getData(from: url)
        // Do any additional setup after loading the view.
    }
    func dataLoaded(){
        print(dataSource.count)
        DispatchQueue.main.async {
            self.loadingIndicator.stopAnimating()
            self.loadingIndicator.isHidden = true
            self.collectionView.isHidden = false
            self.collectionView.reloadData()
        }
    }
    func loadMoreData(){
        pageNumber += 1
        url = "https://api.themoviedb.org/3/movie/top_rated?api_key=e20080ab8b395f936423b819c9b6b689&language=en-US&page=\(pageNumber)"
        print(url)
        self.loadData(completion: { [weak self] (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let result = result {
                self!.dataSource.append(contentsOf: result.results!)
                self!.dataLoaded()
                
            }
        })
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let isReachingEnd = scrollView.contentOffset.y >= 0
        && scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)
        if(isReachingEnd){
            //            loadMoreData()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if let movieCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell{
            if(indexPath.row == dataSource.count-3){
                loadMoreData()
            }
            movieCell.configure(movieModel: dataSource[indexPath.row])
            cell = movieCell
        }
        return cell
    }
    func loadData(completion: @escaping (_ data: Json4Swift_Base?, _ error: Error?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=e20080ab8b395f936423b819c9b6b689&language=en-US")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            do {
                if let data = data {
                    let json = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(Json4Swift_Base.self, from: data)
                    
                    completion(responseModel, nil)
                } else {
                    completion(nil, nil)
                }
            } catch {
                completion(nil, error)
            }
        })
        task.resume()
    }
}

