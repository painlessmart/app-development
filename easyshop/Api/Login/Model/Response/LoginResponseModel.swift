//
//  LoginResponseModel.swift
//
//  Created by Ali Ghanavati on 3/23/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class LoginResponseModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kLoginResponseModelRefreshTokenKey: String = "refresh_token"
  private let kLoginResponseModelAccessTokenKey: String = "access_token"
    private let kLoginResponseModelMessageKey: String = "message"

  // MARK: Properties
  public var refreshToken: String?
  public var accessToken: String?
    public var message : String?

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
    refreshToken = json[kLoginResponseModelRefreshTokenKey].string
    accessToken = json[kLoginResponseModelAccessTokenKey].string
    message = json[kLoginResponseModelMessageKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = refreshToken { dictionary[kLoginResponseModelRefreshTokenKey] = value }
    if let value = accessToken { dictionary[kLoginResponseModelAccessTokenKey] = value }
    if let value = message{ dictionary[kLoginResponseModelMessageKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.refreshToken = aDecoder.decodeObject(forKey: kLoginResponseModelRefreshTokenKey) as? String
    self.accessToken = aDecoder.decodeObject(forKey: kLoginResponseModelAccessTokenKey) as? String
    self.message = aDecoder.decodeObject(forKey: kLoginResponseModelMessageKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(refreshToken, forKey: kLoginResponseModelRefreshTokenKey)
    aCoder.encode(accessToken, forKey: kLoginResponseModelAccessTokenKey)
    aCoder.encode(message , forKey: kLoginResponseModelMessageKey)
  }

}
