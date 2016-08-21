//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories : [GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: () ->()) {
        
        GithubAPIClient.getRepositoriesWithCompletion { (tempArray) in
            self.repositories.removeAll()
            for dict in self.repositories {
            
            let repo = GithubRepository.init(dictionary: dict as! NSDictionary)
                self.repositories.append(repo)}
                if self.repositories.count > 0 {
                    completion()
                }
        }
    }
    
    
}
