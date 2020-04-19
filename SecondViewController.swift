//
//  SecondViewController.swift
//  InfoSysInterview
//
//  Created by Neha Singh on 19/04/20.
//  Copyright © 2020 Neha Singh. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class SecondViewController: UIViewController{
    
    var arrData = [JsonModel]()
    var baseUrl = CommonConstant()
    @IBOutlet weak var tblView: UITableView!
    
    
    lazy var refresher : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
        
        if #available(iOS 10.0, *) {
            tblView.refreshControl = refresher
        } else {
            tblView.addSubview(refresher)
        }
        
    }
    
    func jsonParsing()  {
        
       // let url = URL(string:"https://itunes.apple.com/search?media=music&term=bollywood")
        let url = URL(string:baseUrl.sit   )
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data =  data else
            {
                return
            }
            do{
                let json = try JSON(data:data)
                let result = json["results"]
                for arr in result.arrayValue
                {
                    self.arrData.append(JsonModel(json: arr))
                }
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            }
            catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    @objc func requestData()  {
        print("requesting data")
        let deadLine = DispatchTime.now() + .milliseconds(700)
        DispatchQueue.main.asyncAfter(deadline: deadLine) {
            self.refresher.endRefreshing()
        }
    }
    
    
}

extension SecondViewController : UITableViewDataSource , UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtistTableViewCell
        cell.lblArtist.text  = arrData[indexPath.row].artistName
        cell.lblTrack.text = arrData[indexPath.row].trackCensoredName
        cell.imgView.kf.setImage(with:URL(string: arrData[indexPath.row].artistViewUrl))
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
