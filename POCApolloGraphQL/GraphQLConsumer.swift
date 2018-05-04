//
//  GraphQLConsumer.swift
//  POCApolloGraphQL
//
//  Created by Tatiana Magdalena on 04/05/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation
import Apollo

struct GraphQLConsumer {
    
    let apollo = ApolloClient(url: URL(string: "https://api.graphloc.com/graphql")!)
    
    func fetchLocation() {
        apollo.fetch(query: LocationQueryQuery(ip: "189.59.228.170")) { (result, error) in
//            print(result?.data?.getLocation?.country?.geonameId ?? "")
//            print(result?.data?.getLocation?.country?.names?.en ?? "")
            print(result?.data?.getLocation?.location?.latitude ?? "")
            print(result?.data?.getLocation?.location?.longitude ?? "")
        }
    }
    
}
