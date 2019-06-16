//
//  CurrencyGetModel.swift
//
//  Created by Ali Ghanavati on 3/27/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CurrencyGetModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kCurrencyGetModelInternalIdentifierKey: String = "id"
  private let kCurrencyGetModelCurrencyKey: String = "currency"
  private let kCurrencyGetModelDescriptionValueKey: String = "description"

  // MARK: Properties
  public var internalIdentifier: Int?
  public var currency: String?
  public var descriptionValue: String?

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
    internalIdentifier = json[kCurrencyGetModelInternalIdentifierKey].int
    currency = json[kCurrencyGetModelCurrencyKey].string
    descriptionValue = json[kCurrencyGetModelDescriptionValueKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = internalIdentifier { dictionary[kCurrencyGetModelInternalIdentifierKey] = value }
    if let value = currency { dictionary[kCurrencyGetModelCurrencyKey] = value }
    if let value = descriptionValue { dictionary[kCurrencyGetModelDescriptionValueKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.internalIdentifier = aDecoder.decodeObject(forKey: kCurrencyGetModelInternalIdentifierKey) as? Int
    self.currency = aDecoder.decodeObject(forKey: kCurrencyGetModelCurrencyKey) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: kCurrencyGetModelDescriptionValueKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(internalIdentifier, forKey: kCurrencyGetModelInternalIdentifierKey)
    aCoder.encode(currency, forKey: kCurrencyGetModelCurrencyKey)
    aCoder.encode(descriptionValue, forKey: kCurrencyGetModelDescriptionValueKey)
  }

}
