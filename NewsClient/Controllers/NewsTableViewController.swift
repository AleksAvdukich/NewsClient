//
//  NewsTableViewController.swift
//  NewsClient
//
//  Created by Aleksandr Avdukich on 24.10.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    struct Result {
        
    }
    
    var news = [Article]()
    let cellId = "cellId"
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    let plugView = PlugView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchNews()
    }
    
    fileprivate func setupView() {
        let nib = UINib(nibName: "NewsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        
        tableView.tableFooterView = UIView(frame: .zero)
        
        tableView.backgroundView = activityIndicator
        
        self.activityIndicator.center = self.tableView.center
        
    }
    
    func fetchNews() {
        activityIndicator.startAnimating()
        
        APIService.shared.fetchNews { (result) in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
            
            switch result {
            case .success(let news):
                print("!!! 3", Thread.current)
                self.news = news
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let err):
                DispatchQueue.main.async {
                    self.tableView.backgroundView = self.plugView
                    self.plugView.center = self.tableView.center
                    self.plugView.isHidden = false
                    self.plugView.setErrorTitle(err.description)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! NewsCell
        
        let new = self.news[indexPath.row]
        cell.new = new
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        140
    }
    
}
