//
//  AddAccountViewModel.swift
//  BalanceiOS
//
//  Created by Red Davis on 05/09/2017.
//  Copyright © 2017 Balanced Software, Inc. All rights reserved.
//

import Foundation


final class NewAccountListViewModel
{
    // Internal
    var numberOfSources: Int {
        return self.sources.count
    }
    
    // Private
    private let sources: [Source] = [.coinbase, .gdax, .poloniex, .bitfinex, .kraken, .bittrex, .ethplorer]

    // MARK: Initialization
    
    required init()
    {
        
    }
    
    // MARK: Data
    
    func source(at index: Int) -> Source
    {
        return self.sources[index]
    }
}
