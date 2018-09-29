//
//  ViewController.swift
//  MovieSwift
//
//  Created by Arun Kumar on 9/26/18.
//  Copyright © 2018 Arun Kumar. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var arrMovies : [Movie]? = [Movie](){
        didSet{
            myTableView.reloadData()
        }
    }
    
    let objApiHandler = ApiHandler()
    @IBOutlet weak var myTableView : UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        objApiHandler.getMoviesList(url: BaseUrl.endPoint)
        objApiHandler.delegate = self
    }
    
}

extension ViewController : MoviesListProtocol{
    
    func getMoviesListFinished(data arrMovies: [Movie]?) {
        self.arrMovies = arrMovies!
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let x = arrMovies else {
            return 0
        }
       return x.count
    }
}


extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        let objMovie = arrMovies![indexPath.row]
        cell.titleLbl.text = objMovie.title
        cell.popularityLbl.text = String(objMovie.popularity)
        cell.releaseDateLbl.text = String(objMovie.release_date)
        let imageName = objMovie.poster_path ?? ""
        if imageName.count > 0 {
            cell.posterImgView?.sd_setImage(with: URL(string:BaseUrl.imagePath + imageName), placeholderImage: #imageLiteral(resourceName: "xyz"), options: .cacheMemoryOnly, completed: { (image, error, option, url) in
                
               if image == nil{
                print("image issue" )

                }
                if error != nil {
                 
                }
                print("completed")
            })
        }
        return cell
    }
}
