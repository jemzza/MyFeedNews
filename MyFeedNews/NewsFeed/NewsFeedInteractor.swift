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
  
  func makeRequest(request: NewsFeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsFeedService()
    }
    
    switch request {
        
    case .some:
        print(".some Interactor")
        presenter?.presentData(response: .some)
    case .getFeed:
        print(".getFeed Interactor")
        presenter?.presentData(response: .presentNewsFeed)
    }
    
  }
  
}
