//
//	AlbumImage.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class AlbumImage : NSObject, NSCoding{

	var text : String!
	var size : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		text = dictionary["#text"] as? String
		size = dictionary["size"] as? String
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
		if size != nil{
			dictionary["size"] = size
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
         size = aDecoder.decodeObject(forKey: "size") as? String

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
		if size != nil{
			aCoder.encode(size, forKey: "size")
		}

	}

}