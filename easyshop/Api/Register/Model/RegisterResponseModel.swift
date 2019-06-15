//
//  RegisterResponseModel.swift
//
//  Created by Ali Ghanavati on 3/24/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class RegisterResponseModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kRegisterResponseModelBrandNameKey: String = "brand_name"
  private let kRegisterResponseModelPasswordKey: String = "password"
  private let kRegisterResponseModelPhoneKey: String = "phone"
  private let kRegisterResponseModelFnKey: String = "fn"
  private let kRegisterResponseModelBusinessNameKey: String = "business_name"
  private let kRegisterResponseModelWorkEmailKey: String = "work_email"
  private let kRegisterResponseModelLnKey: String = "ln"

  // MARK: Properties
  public var brandName: String?
  public var password: String?
  public var phone: String?
  public var fn: String?
  public var businessName: String?
  public var workEmail: String?
  public var ln: String?

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
    brandName = json[kRegisterResponseModelBrandNameKey].string
    password = json[kRegisterResponseModelPasswordKey].string
    phone = json[kRegisterResponseModelPhoneKey].string
    fn = json[kRegisterResponseModelFnKey].string
    businessName = json[kRegisterResponseModelBusinessNameKey].string
    workEmail = json[kRegisterResponseModelWorkEmailKey].string
    ln = json[kRegisterResponseModelLnKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = brandName { dictionary[kRegisterResponseModelBrandNameKey] = value }
    if let value = password { dictionary[kRegisterResponseModelPasswordKey] = value }
    if let value = phone { dictionary[kRegisterResponseModelPhoneKey] = value }
    if let value = fn { dictionary[kRegisterResponseModelFnKey] = value }
    if let value = businessName { dictionary[kRegisterResponseModelBusinessNameKey] = value }
    if let value = workEmail { dictionary[kRegisterResponseModelWorkEmailKey] = value }
    if let value = ln { dictionary[kRegisterResponseModelLnKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.brandName = aDecoder.decodeObject(forKey: kRegisterResponseModelBrandNameKey) as? String
    self.password = aDecoder.decodeObject(forKey: kRegisterResponseModelPasswordKey) as? String
    self.phone = aDecoder.decodeObject(forKey: kRegisterResponseModelPhoneKey) as? String
    self.fn = aDecoder.decodeObject(forKey: kRegisterResponseModelFnKey) as? String
    self.businessName = aDecoder.decodeObject(forKey: kRegisterResponseModelBusinessNameKey) as? String
    self.workEmail = aDecoder.decodeObject(forKey: kRegisterResponseModelWorkEmailKey) as? String
    self.ln = aDecoder.decodeObject(forKey: kRegisterResponseModelLnKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(brandName, forKey: kRegisterResponseModelBrandNameKey)
    aCoder.encode(password, forKey: kRegisterResponseModelPasswordKey)
    aCoder.encode(phone, forKey: kRegisterResponseModelPhoneKey)
    aCoder.encode(fn, forKey: kRegisterResponseModelFnKey)
    aCoder.encode(businessName, forKey: kRegisterResponseModelBusinessNameKey)
    aCoder.encode(workEmail, forKey: kRegisterResponseModelWorkEmailKey)
    aCoder.encode(ln, forKey: kRegisterResponseModelLnKey)
  }

}
