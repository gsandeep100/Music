

import Foundation


class TrackOpensearchQuery : NSObject, NSCoding{

	var text : String!
	var role : String!
	var startPage : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		text = dictionary["#text"] as? String
		role = dictionary["role"] as? String
		startPage = dictionary["startPage"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if text != nil{
			dictionary["#text"] = text
		}
		if role != nil{
			dictionary["role"] = role
		}
		if startPage != nil{
			dictionary["startPage"] = startPage
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         text = aDecoder.decodeObject(forKey: "#text") as? String
         role = aDecoder.decodeObject(forKey: "role") as? String
         startPage = aDecoder.decodeObject(forKey: "startPage") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if text != nil{
			aCoder.encode(text, forKey: "#text")
		}
		if role != nil{
			aCoder.encode(role, forKey: "role")
		}
		if startPage != nil{
			aCoder.encode(startPage, forKey: "startPage")
		}

	}

}
