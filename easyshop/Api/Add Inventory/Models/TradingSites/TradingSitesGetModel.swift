//
//  TradingSitesGetModel.swift
//
//  Created by Ali Ghanavati on 3/27/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class TradingSitesGetModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kTradingSitesGetModelInternalIdentifierKey: String = "id"
  private let kTradingSitesGetModelSiteKey: String = "site"

  // MARK: Properties
  public var internalIdentifier: Int?
  public var site: String?

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
    internalIdentifier = json[kTradingSitesGetModelInternalIdentifierKey].int
    site = json[kTradingSitesGetModelSiteKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = internalIdentifier { dictionary[kTradingSitesGetModelInternalIdentifierKey] = value }
    if let value = site { dictionary[kTradingSitesGetModelSiteKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.internalIdentifier = aDecoder.decodeObject(forKey: kTradingSitesGetModelInternalIdentifierKey) as? Int
    self.site = aDecoder.decodeObject(forKey: kTradingSitesGetModelSiteKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(internalIdentifier, forKey: kTradingSitesGetModelInternalIdentifierKey)
    aCoder.encode(site, forKey: kTradingSitesGetModelSiteKey)
  }

}
