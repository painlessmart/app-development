//
//  CategoriesGetModel.swift
//
//  Created by Ali Ghanavati on 3/27/1398 AP
//  Copyright (c) Ali Ghanavati. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CategoriesGetModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kCategoriesGetModelCategoriesKey: String = "categories"
  private let kCategoriesGetModelCountsKey: String = "counts"

  // MARK: Properties
  public var categories: [CategoriesGetCategories]?
  public var counts: Int?

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
    if let items = json[kCategoriesGetModelCategoriesKey].array { categories = items.map { CategoriesGetCategories(json: $0) } }
    counts = json[kCategoriesGetModelCountsKey].int
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = categories { dictionary[kCategoriesGetModelCategoriesKey] = value.map { $0.dictionaryRepresentation() } }
    if let value = counts { dictionary[kCategoriesGetModelCountsKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.categories = aDecoder.decodeObject(forKey: kCategoriesGetModelCategoriesKey) as? [CategoriesGetCategories]
    self.counts = aDecoder.decodeObject(forKey: kCategoriesGetModelCountsKey) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(categories, forKey: kCategoriesGetModelCategoriesKey)
    aCoder.encode(counts, forKey: kCategoriesGetModelCountsKey)
  }

}
