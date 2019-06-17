//
//  CategoriesGetCategories.swift
//
//  Created by Ali Ghanavati on 3/27/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CategoriesGetCategories: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kCategoriesGetCategoriesInternalIdentifierKey: String = "id"
  private let kCategoriesGetCategoriesNameKey: String = "name"

  // MARK: Properties
  public var internalIdentifier: Int?
  public var name: String?

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
    internalIdentifier = json[kCategoriesGetCategoriesInternalIdentifierKey].int
    name = json[kCategoriesGetCategoriesNameKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = internalIdentifier { dictionary[kCategoriesGetCategoriesInternalIdentifierKey] = value }
    if let value = name { dictionary[kCategoriesGetCategoriesNameKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.internalIdentifier = aDecoder.decodeObject(forKey: kCategoriesGetCategoriesInternalIdentifierKey) as? Int
    self.name = aDecoder.decodeObject(forKey: kCategoriesGetCategoriesNameKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(internalIdentifier, forKey: kCategoriesGetCategoriesInternalIdentifierKey)
    aCoder.encode(name, forKey: kCategoriesGetCategoriesNameKey)
  }

}
