//
//  ListingGetUrlModel.swift
//
//  Created by Ali Ghanavati on 3/31/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListingGetUrlModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kListingGetUrlModelListingTypeNameKey: String = "listing_type_name"
  private let kListingGetUrlModelQuantityKey: String = "quantity"
  private let kListingGetUrlModelItemUrlKey: String = "item_url"
  private let kListingGetUrlModelItemIdKey: String = "item_id"
  private let kListingGetUrlModelItemTitleKey: String = "item_title"
  private let kListingGetUrlModelListingTypeIdKey: String = "listing_type_id"

  // MARK: Properties
  public var listingTypeName: String?
  public var quantity: Int?
  public var itemUrl: String?
  public var itemId: Int?
  public var itemTitle: String?
  public var listingTypeId: Int?

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
    listingTypeName = json[kListingGetUrlModelListingTypeNameKey].string
    quantity = json[kListingGetUrlModelQuantityKey].int
    itemUrl = json[kListingGetUrlModelItemUrlKey].string
    itemId = json[kListingGetUrlModelItemIdKey].int
    itemTitle = json[kListingGetUrlModelItemTitleKey].string
    listingTypeId = json[kListingGetUrlModelListingTypeIdKey].int
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = listingTypeName { dictionary[kListingGetUrlModelListingTypeNameKey] = value }
    if let value = quantity { dictionary[kListingGetUrlModelQuantityKey] = value }
    if let value = itemUrl { dictionary[kListingGetUrlModelItemUrlKey] = value }
    if let value = itemId { dictionary[kListingGetUrlModelItemIdKey] = value }
    if let value = itemTitle { dictionary[kListingGetUrlModelItemTitleKey] = value }
    if let value = listingTypeId { dictionary[kListingGetUrlModelListingTypeIdKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.listingTypeName = aDecoder.decodeObject(forKey: kListingGetUrlModelListingTypeNameKey) as? String
    self.quantity = aDecoder.decodeObject(forKey: kListingGetUrlModelQuantityKey) as? Int
    self.itemUrl = aDecoder.decodeObject(forKey: kListingGetUrlModelItemUrlKey) as? String
    self.itemId = aDecoder.decodeObject(forKey: kListingGetUrlModelItemIdKey) as? Int
    self.itemTitle = aDecoder.decodeObject(forKey: kListingGetUrlModelItemTitleKey) as? String
    self.listingTypeId = aDecoder.decodeObject(forKey: kListingGetUrlModelListingTypeIdKey) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(listingTypeName, forKey: kListingGetUrlModelListingTypeNameKey)
    aCoder.encode(quantity, forKey: kListingGetUrlModelQuantityKey)
    aCoder.encode(itemUrl, forKey: kListingGetUrlModelItemUrlKey)
    aCoder.encode(itemId, forKey: kListingGetUrlModelItemIdKey)
    aCoder.encode(itemTitle, forKey: kListingGetUrlModelItemTitleKey)
    aCoder.encode(listingTypeId, forKey: kListingGetUrlModelListingTypeIdKey)
  }

}
