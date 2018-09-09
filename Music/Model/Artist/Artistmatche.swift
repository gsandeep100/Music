//
//	Artistmatche.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class Artistmatche : NSObject, NSCoding{

	var artist : [Artist]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		artist = [Artist]()
		if let artistArray = dictionary["artist"] as? [[String:Any]]{
			for dic in artistArray{
				let value = Artist(fromDictionary: dic)
				artist.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if artist != nil{
			var dictionaryElements = [[String:Any]]()
			for artistElement in artist {
				dictionaryElements.append(artistElement.toDictionary())
			}
			dictionary["artist"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         artist = aDecoder.decodeObject(forKey :"artist") as? [Artist]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if artist != nil{
			aCoder.encode(artist, forKey: "artist")
		}

	}

}