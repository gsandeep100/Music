//
//	Albummatche.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Albummatche : NSObject, NSCoding{

	var album : [Album]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		album = [Album]()
		if let albumArray = dictionary["album"] as? [[String:Any]]{
			for dic in albumArray{
				let value = Album(fromDictionary: dic)
				album.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if album != nil{
			var dictionaryElements = [[String:Any]]()
			for albumElement in album {
				dictionaryElements.append(albumElement.toDictionary())
			}
			dictionary["album"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         album = aDecoder.decodeObject(forKey :"album") as? [Album]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if album != nil{
			aCoder.encode(album, forKey: "album")
		}

	}

}