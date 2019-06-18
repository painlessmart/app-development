//
//  AddInventoryModel.swift
//
//  Created by Ali Ghanavati on 3/28/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class AddInventoryModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kAddInventoryModelMainPicUrlKey: String = "main_pic_url"
  private let kAddInventoryModelMainPicNameKey: String = "main_pic_name"
  private let kAddInventoryModelDescriptionValueKey: String = "description"
  private let kAddInventoryModelQuantityKey: String = "quantity"
  private let kAddInventoryModelCurIdKey: String = "cur_id"
  private let kAddInventoryModelPriceKey: String = "price"
  private let kAddInventoryModelBrandKey: String = "brand"
  private let kAddInventoryModelShippingCostKey: String = "shipping_cost"
  private let kAddInventoryModelTitleKey: String = "title"
  private let kAddInventoryModelUserIdKey: String = "user_id"
  private let kAddInventoryModelCatIdKey: String = "cat_id"
  private let kAddInventoryModelManufacturerKey: String = "manufacturer"
  private let kAddInventoryModelManufacturerPartNumbersKey: String = "manufacturer_part_numbers"

  // MARK: Properties
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

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  convenience public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    mainPicUrl = json[kAddInventoryModelMainPicUrlKey].string
    mainPicName = json[kAddInventoryModelMainPicNameKey].string
    descriptionValue = json[kAddInventoryModelDescriptionValueKey].string
    quantity = json[kAddInventoryModelQuantityKey].int
    curId = json[kAddInventoryModelCurIdKey].int
    price = json[kAddInventoryModelPriceKey].float
    brand = json[kAddInventoryModelBrandKey].string
    shippingCost = json[kAddInventoryModelShippingCostKey].int
    title = json[kAddInventoryModelTitleKey].string
    userId = json[kAddInventoryModelUserIdKey].int
    catId = json[kAddInventoryModelCatIdKey].int
    manufacturer = json[kAddInventoryModelManufacturerKey].string
    manufacturerPartNumbers = json[kAddInventoryModelManufacturerPartNumbersKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = mainPicUrl { dictionary[kAddInventoryModelMainPicUrlKey] = value }
    if let value = mainPicName { dictionary[kAddInventoryModelMainPicNameKey] = value }
    if let value = descriptionValue { dictionary[kAddInventoryModelDescriptionValueKey] = value }
    if let value = quantity { dictionary[kAddInventoryModelQuantityKey] = value }
    if let value = curId { dictionary[kAddInventoryModelCurIdKey] = value }
    if let value = price { dictionary[kAddInventoryModelPriceKey] = value }
    if let value = brand { dictionary[kAddInventoryModelBrandKey] = value }
    if let value = shippingCost { dictionary[kAddInventoryModelShippingCostKey] = value }
    if let value = title { dictionary[kAddInventoryModelTitleKey] = value }
    if let value = userId { dictionary[kAddInventoryModelUserIdKey] = value }
    if let value = catId { dictionary[kAddInventoryModelCatIdKey] = value }
    if let value = manufacturer { dictionary[kAddInventoryModelManufacturerKey] = value }
    if let value = manufacturerPartNumbers { dictionary[kAddInventoryModelManufacturerPartNumbersKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.mainPicUrl = aDecoder.decodeObject(forKey: kAddInventoryModelMainPicUrlKey) as? String
    self.mainPicName = aDecoder.decodeObject(forKey: kAddInventoryModelMainPicNameKey) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: kAddInventoryModelDescriptionValueKey) as? String
    self.quantity = aDecoder.decodeObject(forKey: kAddInventoryModelQuantityKey) as? Int
    self.curId = aDecoder.decodeObject(forKey: kAddInventoryModelCurIdKey) as? Int
    self.price = aDecoder.decodeObject(forKey: kAddInventoryModelPriceKey) as? Float
    self.brand = aDecoder.decodeObject(forKey: kAddInventoryModelBrandKey) as? String
    self.shippingCost = aDecoder.decodeObject(forKey: kAddInventoryModelShippingCostKey) as? Int
    self.title = aDecoder.decodeObject(forKey: kAddInventoryModelTitleKey) as? String
    self.userId = aDecoder.decodeObject(forKey: kAddInventoryModelUserIdKey) as? Int
    self.catId = aDecoder.decodeObject(forKey: kAddInventoryModelCatIdKey) as? Int
    self.manufacturer = aDecoder.decodeObject(forKey: kAddInventoryModelManufacturerKey) as? String
    self.manufacturerPartNumbers = aDecoder.decodeObject(forKey: kAddInventoryModelManufacturerPartNumbersKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(mainPicUrl, forKey: kAddInventoryModelMainPicUrlKey)
    aCoder.encode(mainPicName, forKey: kAddInventoryModelMainPicNameKey)
    aCoder.encode(descriptionValue, forKey: kAddInventoryModelDescriptionValueKey)
    aCoder.encode(quantity, forKey: kAddInventoryModelQuantityKey)
    aCoder.encode(curId, forKey: kAddInventoryModelCurIdKey)
    aCoder.encode(price, forKey: kAddInventoryModelPriceKey)
    aCoder.encode(brand, forKey: kAddInventoryModelBrandKey)
    aCoder.encode(shippingCost, forKey: kAddInventoryModelShippingCostKey)
    aCoder.encode(title, forKey: kAddInventoryModelTitleKey)
    aCoder.encode(userId, forKey: kAddInventoryModelUserIdKey)
    aCoder.encode(catId, forKey: kAddInventoryModelCatIdKey)
    aCoder.encode(manufacturer, forKey: kAddInventoryModelManufacturerKey)
    aCoder.encode(manufacturerPartNumbers, forKey: kAddInventoryModelManufacturerPartNumbersKey)
  }

}
