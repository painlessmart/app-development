//
//  ListingAddItemErrors.swift
//
//  Created by Ali Ghanavati on 3/30/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListingAddItemErrors: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kListingAddItemErrorsErrorIdKey: String = "error_id"
  private let kListingAddItemErrorsSiteIdKey: String = "site_id"
  private let kListingAddItemErrorsItemIdKey: String = "item_id"
  private let kListingAddItemErrorsMsgKey: String = "msg"

  // MARK: Properties
  public var errorId: Int?
  public var siteId: Int?
  public var itemId: Int?
  public var msg: String?

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
    errorId = json[kListingAddItemErrorsErrorIdKey].int
    siteId = json[kListingAddItemErrorsSiteIdKey].int
    itemId = json[kListingAddItemErrorsItemIdKey].int
    msg = json[kListingAddItemErrorsMsgKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = errorId { dictionary[kListingAddItemErrorsErrorIdKey] = value }
    if let value = siteId { dictionary[kListingAddItemErrorsSiteIdKey] = value }
    if let value = itemId { dictionary[kListingAddItemErrorsItemIdKey] = value }
    if let value = msg { dictionary[kListingAddItemErrorsMsgKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.errorId = aDecoder.decodeObject(forKey: kListingAddItemErrorsErrorIdKey) as? Int
    self.siteId = aDecoder.decodeObject(forKey: kListingAddItemErrorsSiteIdKey) as? Int
    self.itemId = aDecoder.decodeObject(forKey: kListingAddItemErrorsItemIdKey) as? Int
    self.msg = aDecoder.decodeObject(forKey: kListingAddItemErrorsMsgKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(errorId, forKey: kListingAddItemErrorsErrorIdKey)
    aCoder.encode(siteId, forKey: kListingAddItemErrorsSiteIdKey)
    aCoder.encode(itemId, forKey: kListingAddItemErrorsItemIdKey)
    aCoder.encode(msg, forKey: kListingAddItemErrorsMsgKey)
  }

}
