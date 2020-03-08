//
//  NetworkService.swift
//  MyFeedNews
//
//  Created by Alexander on 08.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import Foundation

final class NetworkService {
    
    private let authService: AuthService
    
    init(authService: AuthService = SceneDelegate.shared().authService) {
        self.authService = authService
    }
    
    func getFeed() {
        var components = URLComponents()
        
        // https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&access_token=533bacf01e11f55b536a565b57531ac114461ae8736d6506a3&v=5.103
        
        guard let token = authService.token else { return }
        
        let params = ["filters": "post,photo"]
        var allparams = params
        allparams["access_token"] = token
        allparams["v"] = API.version
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = allparams.map { URLQueryItem(name: $0, value: $1) }
        
        let url = components.url!
        print(url)
    }
}
