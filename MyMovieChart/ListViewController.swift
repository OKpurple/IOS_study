//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by jwh on 2017. 1. 24..
//  Copyright © 2017년 jwh. All rights reserved.
//

import UIKit

class ListViewController : UITableViewController {
    lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        return datalist
    }()
    
    var page = 1
    
    @IBOutlet var moreBtn: UIButton!
    
    @IBAction func more(_ sender: Any) {
        
        self.page += 1
        self.callMoiveAPI()
        self.tableView.reloadData()

        
    }
    
    
    override func viewDidLoad() {
  
        self.callMoiveAPI()
                
            }
   
    func callMoiveAPI(){
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc"
        let apiURI : URL! = URL(string: url)
        
        
        let apidata = try! Data(contentsOf: apiURI)
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result=\(log)")
        
        //파싱
        do{
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            for row in movie {
                let r = row as! NSDictionary
                
                let mvo = MovieVO()
                
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                let url : URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                
                mvo.thumbnailImage = UIImage(data:imageData)
                
                
                self.list.append(mvo)
                
                let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
                
                if(self.list.count >= totalCount){
                    self.moreBtn.isHidden = true
                }
            }
        }catch{
            NSLog("parser Error")
        }
    }
    
    func getThumbnailImage(_ index : Int) -> UIImage{
        let mvo = self.list[index]
        
        if let savedImage = mvo.thumbnailImage{
            return savedImage
        }else {
            let url : URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            
            mvo.thumbnailImage = UIImage(data:imageData)
            
            return mvo.thumbnailImage!
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        

        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        //cell.thumbnail.image = row.thumbnailImage
        
        DispatchQueue.main.async(
            execute: {
                cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다")
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_detail"{
            let path = self.tableView.indexPath(for: sender as! MovieCell)
            
        let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = self.list[path!.row]
        }}
    
    
}
