//
//  ListingAddItemModel.swift
//
//  Created by Ali Ghanavati on 3/30/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListingAddItemModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kListingAddItemModelItemsPublishedKey: String = "items_published"
  private let kListingAddItemModelMessageKey: String = "message"
  private let kListingAddItemModelErrorsKey: String = "errors"

  // MARK: Properties
  public var itemsPublished: [ListingAddItemItemsPublished]?
  public var message: String?
  public var errors: [ListingAddItemErrors]?

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
    if let items = json[kListingAddItemModelItemsPublishedKey].array { itemsPublished = items.map { ListingAddItemItemsPublished(json: $0) } }
    message = json[kListingAddItemModelMessageKey].string
    if let items = json[kListingAddItemModelErrorsKey].array { errors = items.map { ListingAddItemErrors(json: $0) } }
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = itemsPublished { dictionary[kListingAddItemModelItemsPublishedKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = message { dictionary[kListingAddItemModelMessageKey] = value }
    if let value = errors { dictionary[kListingAddItemModelErrorsKey] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.itemsPublished = aDecoder.decodeObject(forKey: kListingAddItemModelItemsPublishedKey) as? [ListingAddItemItemsPublished]
    self.message = aDecoder.decodeObject(forKey: kListingAddItemModelMessageKey) as? String
    self.errors = aDecoder.decodeObject(forKey: kListingAddItemModelErrorsKey) as? [ListingAddItemErrors]
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(itemsPublished, forKey: kListingAddItemModelItemsPublishedKey)
    aCoder.encode(message, forKey: kListingAddItemModelMessageKey)
    aCoder.encode(errors, forKey: kListingAddItemModelErrorsKey)
  }

}
