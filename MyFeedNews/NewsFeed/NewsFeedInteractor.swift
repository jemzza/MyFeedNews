//
//  NewsFeedInteractor.swift
//  MyFeedNews
//
//  Created by Alexander on 08.03.2020.
//  Copyright (c) 2020 Alexander Litvinov. All rights reserved.
//

import UIKit

protocol NewsFeedBusinessLogic {
    func makeRequest(request: NewsFeed.Model.Request.RequestType)
}

class NewsFeedInteractor: NewsFeedBusinessLogic {
    
    var presenter: NewsFeedPresentationLogic?
    var service: NewsFeedService?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    func makeRequest(request: NewsFeed.Model.Request.RequestType) {
        if service == nil {
            service = NewsFeedService()
        }
        
        switch request {
            
        case .getNewsFeed:
            fetcher.getFeed { [weak self] (feedResponse) in
                
//                feedResponse?.items.map({ (feedItem) in
//                    print("\(feedItem.attachments) \n\n")
//                })
                

                guard let feedResponse = feedResponse else { return }
                self?.presenter?.presentData(response: .presentNewsFeed(feed: feedResponse))
            }
        }
        
    }
    
}
