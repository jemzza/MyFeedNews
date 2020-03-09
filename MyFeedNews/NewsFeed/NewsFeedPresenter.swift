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

    case .some:
        print(".some Presenter")
        viewController?.displayData(viewModel: .displayNewsFeed)
    case .presentNewsFeed:
        print(".presentNewsFeed Presenter")
        viewController?.displayData(viewModel: .displayNewsFeed)
    }
  }
  
}
