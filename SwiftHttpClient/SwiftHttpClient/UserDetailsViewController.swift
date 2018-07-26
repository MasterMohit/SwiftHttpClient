//
//  UserDetailsViewController.swift
//  SwiftHttpClient
//
//  Created by Mohit Kumar on 7/26/18.
//  Copyright © 2018 Mohit Kumar. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    var userId:Int?

    var user:User?
    
    var baseUrl = "https://jsonplaceholder.typicode.com/users/"
    
    @IBOutlet weak var txvUserDetails: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userId = userId {
            baseUrl = baseUrl+String(userId)
            
            HTTPClient.sharedInstance.getResponse(url: baseUrl, withJson: nil, apiType: .GET, onSuccess: { (data) in
                
                guard let data = data else{
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    
                    self.user = try decoder.decode(User.self, from: data)
                    
                    DispatchQueue.main.async {
                        
                        if let user=self.user{
                            
                            let msg = " User name = "+user.name! + " Company = "+(user.company?.name)!
                            
                            self.txvUserDetails.text = msg

                        }
                    }
                    
                }catch _{
                    
                }
            }) { (error) in
            
            }
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
