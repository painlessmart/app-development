//
//  ListingTypeModel.swift
//
//  Created by Ali Ghanavati on 3/30/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ListingTypeModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kListingTypeModelInternalIdentifierKey: String = "id"
  private let kListingTypeModelListTypeKey: String = "list_type"

  // MARK: Properties
  public var internalIdentifier: Int?
  public var listType: String?

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
    internalIdentifier = json[kListingTypeModelInternalIdentifierKey].int
    listType = json[kListingTypeModelListTypeKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = internalIdentifier { dictionary[kListingTypeModelInternalIdentifierKey] = value }
    if let value = listType { dictionary[kListingTypeModelListTypeKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.internalIdentifier = aDecoder.decodeObject(forKey: kListingTypeModelInternalIdentifierKey) as? Int
    self.listType = aDecoder.decodeObject(forKey: kListingTypeModelListTypeKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(internalIdentifier, forKey: kListingTypeModelInternalIdentifierKey)
    aCoder.encode(listType, forKey: kListingTypeModelListTypeKey)
  }

}
