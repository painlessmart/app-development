//
//  EasyShopErrorModel.swift
//
//  Created by Ali Ghanavati on 3/23/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class EasyShopErrorModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kEasyShopErrorModelMessageKey: String = "message"

  // MARK: Properties
  public var message: String?

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
    message = json[kEasyShopErrorModelMessageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = message { dictionary[kEasyShopErrorModelMessageKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.message = aDecoder.decodeObject(forKey: kEasyShopErrorModelMessageKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(message, forKey: kEasyShopErrorModelMessageKey)
  }

}
