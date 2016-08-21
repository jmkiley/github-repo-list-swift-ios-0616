//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient : Secrets {
    
    class func getRepositoriesWithCompletion(completion: (NSArray) -> ()) {
        
        let urlString = "\(githubAPIURL)/repositories?client_id=\(githubClientID)&client_secret=\(githubClientSecret)"
        let session = NSURLSession.sharedSession()
        let tempArray = []
        guard let url = NSURL(string: urlString) else {assertionFailure("No go"); return}
        
        let dataTask = session.dataTaskWithURL(url){data,response,error in
            print(data)
            print(response)
            print(error)
            guard let jsonData = data else {assertionFailure("No go on data"); return }
            if let array = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: []) as? NSArray {
//                if let array = array {
                    completion(array)
//                }
            }
            
        }
        dataTask.resume()
    }
    
    
    
    //Move id and secret to secrets.swift
    
}

