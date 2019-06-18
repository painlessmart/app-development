//
//  AddInventoryRequest.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import Foundation
struct AddInventoryRequest {
    public var mainPicUrl: String?
    public var mainPicName: String?
    public var descriptionValue: String?
    public var quantity: Int?
    public var curId: Int?
    public var price: Float?
    public var brand: String?
    public var shippingCost: Int?
    public var title: String?
    public var userId: Int?
    public var catId: Int?
    public var manufacturer: String?
    public var manufacturerPartNumbers: String?
    func getParameters() -> [String : Any] {
        var params = [String : Any]()
        params["main_pic_url"] = mainPicUrl
        params["main_pic_name"] = mainPicName
        params["description"] = descriptionValue
        params["quantity"] = quantity
        params["cur_id"] = curId
        params["price"] = price
        params["brand"] = brand
        params["shipping_cost"] = shippingCost
        params["title"] = title
        params["user_id"] = userId
        params["cat_id"] = catId
        params["manufacturer"] = manufacturer
        params["manufacturer_part_numbers"] = manufacturerPartNumbers
        return params
    }
}
