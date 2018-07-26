//
//  PostTableViewController.swift
//  SwiftHttpClient
//
//  Created by Mohit Kumar on 7/26/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    var posts:[Post]?
    
    var postUrl = "https://jsonplaceholder.typicode.com/posts"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HTTPClient.sharedInstance.getResponse(url: postUrl, withJson: nil, apiType: .GET, onSuccess: { (data) in
            
            if let data = data{
                do{
                    let decoder = JSONDecoder()
                    
                    self.posts = try decoder.decode([Post].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch let err{
                    print("Parsing error is ",err)
                }
            }
            
        }) { (error) in
            print("Http error is ",error?.localizedDescription as Any)

        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        guard let count = self.posts?.count else{
            return 0;
        }
        return count;
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)


        let post:Post = self.posts![indexPath.row]
        
        cell.textLabel?.text = post.title
        
        cell.detailTextLabel?.text = post.body
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post:Post = self.posts![indexPath.row]
        
        let vc:UserDetailsViewController? = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as? UserDetailsViewController
        
        if let vc = vc {
            
            vc.userId = post.userId
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
  
  
}
