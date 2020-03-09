//
//  NewsFeedPresenter.swift
//  MyFeedNews
//
//  Created by Alexander on 08.03.2020.
//  Copyright (c) 2020 Alexander Litvinov. All rights reserved.
//

import UIKit

protocol NewsFeedPresentationLogic {
  func presentData(response: NewsFeed.Model.Response.ResponseType)
}

class NewsFeedPresenter: NewsFeedPresentationLogic {
  weak var viewController: NewsFeedDisplayLogic?
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
  
    switch response {
    case .presentNewsFeed(let feed):
        
        let cells = feed.items.map { (feedItem) in
            cellViewModel(from: feedItem)
        }
        
        let feedViewModel = FeedViewModel.init(cells: cells)
        viewController?.displayData(viewModel: .displayNewsFeed(feedViewModel: feedViewModel))
    }
  }
    
    private func cellViewModel(from feedItem: FeedItem) -> FeedViewModel.Cell {
        return FeedViewModel.Cell.init(iconUrlString: "",
                                       name: "future name",
                                       date: "future date",
                                       text: feedItem.text,
                                       likes: String(feedItem.likes?.count ?? 0),
                                       comments: String(feedItem.comments?.count ?? 0),
                                       shares: String(feedItem.reposts?.count ?? 0),
                                       views: String(feedItem.views?.count ?? 0))
    }
  
}
