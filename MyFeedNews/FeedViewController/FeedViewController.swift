//
//  FeedViewController.swift
//  MyFeedNews
//
//  Created by Alexander on 08.03.2020.
//  Copyright © 2020 Alexander Litvinov. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getFeed()
        view.backgroundColor = .systemBlue
    }
}
