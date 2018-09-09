//
//	ArtistRootClass.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class ArtistRootClass : NSObject, NSCoding{

	var results : ArtistResult!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let resultsData = dictionary["results"] as? [String:Any]{
			results = ArtistResult(fromDictionary: resultsData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if results != nil{
			dictionary["results"] = results.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         results = aDecoder.decodeObject(forKey: "results") as? ArtistResult

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if results != nil{
			aCoder.encode(results, forKey: "results")
		}

	}

}