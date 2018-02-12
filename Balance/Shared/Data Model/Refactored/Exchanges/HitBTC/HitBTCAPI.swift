//
//  HitBTCAPI.swift
//  Balance
//
//  Created by Eli Pacheco Hoyos on 2/11/18.
//  Copyright © 2018 Balanced Software, Inc. All rights reserved.
//

import Foundation

class HitBTCAPI: AbstractApi {
    
    override var requestMethod: ApiRequestMethod { return .get }
    override var requestDataFormat: ApiRequestDataFormat { return .urlEncoded }
    override var requestEncoding: ApiRequestEncoding { return .baseAuthentication }
    
    override func createRequest(for action: APIAction) -> URLRequest? {
        switch action.type {
        case .accounts, .transactions(_):
            guard let url = action.url,
                let baseCredentials = encodeCredentialsWithBaseAuthentication(with: action) else {
                return nil
            }
            
            var request = URLRequest(url: url)
            request.setValue(baseCredentials.value, forHTTPHeaderField: baseCredentials.header)
            request.httpMethod = requestMethod.rawValue
            
            return request
        }
    }
    
    override func buildAccounts(from data: Data) -> Any {
        do {
            let accounts = try JSONDecoder().decode([HitBTCAccount].self, from: data)
            
            return accounts
        } catch {
            print("Accounts from hitbtc can not be parsed to an object\n\(error)")
            return []
        }
    }
    
    override func buildTransactions(from data: Data) -> Any {
        do {
            let transactions = try JSONDecoder().decode([HitBTCTransaction].self, from: data)
            
            return transactions
        } catch {
            print("Transactions from hitbtc can not be parsed to an object\n\(error)")
            return []
        }
    }
    
    override func processApiErrors(from data: Data) -> Error? {
        return nil
    }
    
}

//TODO: delete the code below(When new interface is done)
extension HitBTCAPI: ExchangeApi {
    
    func authenticationChallenge(loginStrings: [Field], existingInstitution: Institution?, closeBlock: @escaping (Bool, Error?, Institution?) -> Void) {
        //Not needed when the new refactor has been finished!!!!
    }
    
}
