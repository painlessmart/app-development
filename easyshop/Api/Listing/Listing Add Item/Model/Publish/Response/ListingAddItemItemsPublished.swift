//
//  ListingAddItemItemsPublished.swift
//
//  Created by Ali Ghanavati on 3/30/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListingAddItemItemsPublished: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kListingAddItemItemsPublishedItemIdKey: String = "item_id"
  private let kListingAddItemItemsPublishedSiteIdKey: String = "site_id"
  private let kListingAddItemItemsPublishedItemUrlKey: String = "item_url"

  // MARK: Properties
  public var itemId: Int?
  public var siteId: Int?
  public var itemUrl: String?

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
    itemId = json[kListingAddItemItemsPublishedItemIdKey].int
    siteId = json[kListingAddItemItemsPublishedSiteIdKey].int
    itemUrl = json[kListingAddItemItemsPublishedItemUrlKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = itemId { dictionary[kListingAddItemItemsPublishedItemIdKey] = value }
    if let value = siteId { dictionary[kListingAddItemItemsPublishedSiteIdKey] = value }
    if let value = itemUrl { dictionary[kListingAddItemItemsPublishedItemUrlKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.itemId = aDecoder.decodeObject(forKey: kListingAddItemItemsPublishedItemIdKey) as? Int
    self.siteId = aDecoder.decodeObject(forKey: kListingAddItemItemsPublishedSiteIdKey) as? Int
    self.itemUrl = aDecoder.decodeObject(forKey: kListingAddItemItemsPublishedItemUrlKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(itemId, forKey: kListingAddItemItemsPublishedItemIdKey)
    aCoder.encode(siteId, forKey: kListingAddItemItemsPublishedSiteIdKey)
    aCoder.encode(itemUrl, forKey: kListingAddItemItemsPublishedItemUrlKey)
  }

}
