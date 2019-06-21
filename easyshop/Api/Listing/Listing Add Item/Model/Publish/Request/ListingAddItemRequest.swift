//
//  ListingAddItemRequest.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/30/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation


struct ListingAddItemRequest {
    var user_id : String
    var item_id : Int
    var listing_type_id : Int
    var quantity : Int
    var price : Float
    var site_id : Int
    func getParameters() -> [String : Any] {
        var params = [String : Any]()
        var itemsParams = [String : Any]()
        params["user_id"] = user_id
        itemsParams["item_id"] = item_id
        itemsParams["listing_type_id"] = listing_type_id
        itemsParams["quantity"] = quantity
        itemsParams["price"] = price
        itemsParams["site_id"] = site_id
        params["items"] = itemsParams
        return params
    }
}

