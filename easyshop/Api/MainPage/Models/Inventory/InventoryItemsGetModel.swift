//
//  InventoryItemsGetModel.swift
//
//  Created by Ali Ghanavati on 3/27/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

struct InventoryItemsGetModelCodeble: Codable {
     var main_pic_url: String?
     var main_pic_name: String?
     var description: String?
     var quantity: Int?
     var cur_id: Int?
     var price: Double?
     var brand: String?
     var id: Int?
     var shipping_cost: Int?
     var title: String?
     var user_id: Int?
     var cat_id: Int?
     var manufacturer: String?
     var manufacturer_part_numbers: String?
}
class InventoryItemModels {
    public func array(objects : [Any]) -> [InventoryItemsGetModelCodeble]? {
        let paramsJSON = JSON(objects)
        let paramsString = paramsJSON.rawString(String.Encoding.utf8, options: JSONSerialization.WritingOptions.prettyPrinted)!
        
        let jsonData = Data(paramsString.utf8)
        let decoder = JSONDecoder()
        
        do {
            let item = try decoder.decode([InventoryItemsGetModelCodeble].self, from: jsonData)
            return item
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
//public class InventoryItemsGetModel: NSCoding {
//
//  // MARK: Declaration for string constants to be used to decode and also serialize.
//  private let kInventoryItemsGetModelMainPicUrlKey: String = "main_pic_url"
//  private let kInventoryItemsGetModelMainPicNameKey: String = "main_pic_name"
//  private let kInventoryItemsGetModelDescriptionValueKey: String = "description"
//  private let kInventoryItemsGetModelQuantityKey: String = "quantity"
//  private let kInventoryItemsGetModelCurIdKey: String = "cur_id"
//  private let kInventoryItemsGetModelPriceKey: String = "price"
//  private let kInventoryItemsGetModelBrandKey: String = "brand"
//  private let kInventoryItemsGetModelInternalIdentifierKey: String = "id"
//  private let kInventoryItemsGetModelShippingCostKey: String = "shipping_cost"
//  private let kInventoryItemsGetModelTitleKey: String = "title"
//  private let kInventoryItemsGetModelUserIdKey: String = "user_id"
//  private let kInventoryItemsGetModelCatIdKey: String = "cat_id"
//  private let kInventoryItemsGetModelManufacturerKey: String = "manufacturer"
//  private let kInventoryItemsGetModelManufacturerPartNumbersKey: String = "manufacturer_part_numbers"
//
//  // MARK: Properties
//  public var mainPicUrl: String?
//  public var mainPicName: String?
//  public var descriptionValue: String?
//  public var quantity: Int?
//  public var curId: Int?
//  public var price: Int?
//  public var brand: String?
//  public var internalIdentifier: Int?
//  public var shippingCost: Int?
//  public var title: String?
//  public var userId: Int?
//  public var catId: Int?
//  public var manufacturer: String?
//  public var manufacturerPartNumbers: String?
//
//  // MARK: SwiftyJSON Initalizers
//  /**
//   Initates the instance based on the object
//   - parameter object: The object of either Dictionary or Array kind that was passed.
//   - returns: An initalized instance of the class.
//  */
//  convenience public init(object: [Any]) {
//
//    self.init(json: JSON(object))
//  }
//
//
//  /**
//   Initates the instance based on the JSON that was passed.
//   - parameter json: JSON object from SwiftyJSON.
//   - returns: An initalized instance of the class.
//  */
//  public init(json: JSON) {
//    mainPicUrl = json[kInventoryItemsGetModelMainPicUrlKey].string
//    mainPicName = json[kInventoryItemsGetModelMainPicNameKey].string
//    descriptionValue = json[kInventoryItemsGetModelDescriptionValueKey].string
//    quantity = json[kInventoryItemsGetModelQuantityKey].int
//    curId = json[kInventoryItemsGetModelCurIdKey].int
//    price = json[kInventoryItemsGetModelPriceKey].int
//    brand = json[kInventoryItemsGetModelBrandKey].string
//    internalIdentifier = json[kInventoryItemsGetModelInternalIdentifierKey].int
//    shippingCost = json[kInventoryItemsGetModelShippingCostKey].int
//    title = json[kInventoryItemsGetModelTitleKey].string
//    userId = json[kInventoryItemsGetModelUserIdKey].int
//    catId = json[kInventoryItemsGetModelCatIdKey].int
//    manufacturer = json[kInventoryItemsGetModelManufacturerKey].string
//    manufacturerPartNumbers = json[kInventoryItemsGetModelManufacturerPartNumbersKey].string
//  }
//
//  /**
//   Generates description of the object in the form of a NSDictionary.
//   - returns: A Key value pair containing all valid values in the object.
//  */
//  public func dictionaryRepresentation() -> [String: Any] {
//    var dictionary: [String: Any] = [:]
//    if let value = mainPicUrl { dictionary[kInventoryItemsGetModelMainPicUrlKey] = value }
//    if let value = mainPicName { dictionary[kInventoryItemsGetModelMainPicNameKey] = value }
//    if let value = descriptionValue { dictionary[kInventoryItemsGetModelDescriptionValueKey] = value }
//    if let value = quantity { dictionary[kInventoryItemsGetModelQuantityKey] = value }
//    if let value = curId { dictionary[kInventoryItemsGetModelCurIdKey] = value }
//    if let value = price { dictionary[kInventoryItemsGetModelPriceKey] = value }
//    if let value = brand { dictionary[kInventoryItemsGetModelBrandKey] = value }
//    if let value = internalIdentifier { dictionary[kInventoryItemsGetModelInternalIdentifierKey] = value }
//    if let value = shippingCost { dictionary[kInventoryItemsGetModelShippingCostKey] = value }
//    if let value = title { dictionary[kInventoryItemsGetModelTitleKey] = value }
//    if let value = userId { dictionary[kInventoryItemsGetModelUserIdKey] = value }
//    if let value = catId { dictionary[kInventoryItemsGetModelCatIdKey] = value }
//    if let value = manufacturer { dictionary[kInventoryItemsGetModelManufacturerKey] = value }
//    if let value = manufacturerPartNumbers { dictionary[kInventoryItemsGetModelManufacturerPartNumbersKey] = value }
//    return dictionary
//  }
//
//  // MARK: NSCoding Protocol
//  required public init(coder aDecoder: NSCoder) {
//    self.mainPicUrl = aDecoder.decodeObject(forKey: kInventoryItemsGetModelMainPicUrlKey) as? String
//    self.mainPicName = aDecoder.decodeObject(forKey: kInventoryItemsGetModelMainPicNameKey) as? String
//    self.descriptionValue = aDecoder.decodeObject(forKey: kInventoryItemsGetModelDescriptionValueKey) as? String
//    self.quantity = aDecoder.decodeObject(forKey: kInventoryItemsGetModelQuantityKey) as? Int
//    self.curId = aDecoder.decodeObject(forKey: kInventoryItemsGetModelCurIdKey) as? Int
//    self.price = aDecoder.decodeObject(forKey: kInventoryItemsGetModelPriceKey) as? Int
//    self.brand = aDecoder.decodeObject(forKey: kInventoryItemsGetModelBrandKey) as? String
//    self.internalIdentifier = aDecoder.decodeObject(forKey: kInventoryItemsGetModelInternalIdentifierKey) as? Int
//    self.shippingCost = aDecoder.decodeObject(forKey: kInventoryItemsGetModelShippingCostKey) as? Int
//    self.title = aDecoder.decodeObject(forKey: kInventoryItemsGetModelTitleKey) as? String
//    self.userId = aDecoder.decodeObject(forKey: kInventoryItemsGetModelUserIdKey) as? Int
//    self.catId = aDecoder.decodeObject(forKey: kInventoryItemsGetModelCatIdKey) as? Int
//    self.manufacturer = aDecoder.decodeObject(forKey: kInventoryItemsGetModelManufacturerKey) as? String
//    self.manufacturerPartNumbers = aDecoder.decodeObject(forKey: kInventoryItemsGetModelManufacturerPartNumbersKey) as? String
//  }
//
//  public func encode(with aCoder: NSCoder) {
//    aCoder.encode(mainPicUrl, forKey: kInventoryItemsGetModelMainPicUrlKey)
//    aCoder.encode(mainPicName, forKey: kInventoryItemsGetModelMainPicNameKey)
//    aCoder.encode(descriptionValue, forKey: kInventoryItemsGetModelDescriptionValueKey)
//    aCoder.encode(quantity, forKey: kInventoryItemsGetModelQuantityKey)
//    aCoder.encode(curId, forKey: kInventoryItemsGetModelCurIdKey)
//    aCoder.encode(price, forKey: kInventoryItemsGetModelPriceKey)
//    aCoder.encode(brand, forKey: kInventoryItemsGetModelBrandKey)
//    aCoder.encode(internalIdentifier, forKey: kInventoryItemsGetModelInternalIdentifierKey)
//    aCoder.encode(shippingCost, forKey: kInventoryItemsGetModelShippingCostKey)
//    aCoder.encode(title, forKey: kInventoryItemsGetModelTitleKey)
//    aCoder.encode(userId, forKey: kInventoryItemsGetModelUserIdKey)
//    aCoder.encode(catId, forKey: kInventoryItemsGetModelCatIdKey)
//    aCoder.encode(manufacturer, forKey: kInventoryItemsGetModelManufacturerKey)
//    aCoder.encode(manufacturerPartNumbers, forKey: kInventoryItemsGetModelManufacturerPartNumbersKey)
//  }
//
//}
//
//
