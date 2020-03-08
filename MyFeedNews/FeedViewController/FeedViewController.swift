//
//  FeedViewController.swift
//  MyFeedNews
//
//  Created by Alexander on 08.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService: Networking = NetworkService()
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else { return }
            feedResponse.items.map { (feedItem) in
                print(feedItem.date)
            }
        }
    }
}
