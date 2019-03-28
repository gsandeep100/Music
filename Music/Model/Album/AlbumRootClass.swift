

import Foundation


class AlbumRootClass : NSObject, NSCoding{

	var results : AlbumResult!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let resultsData = dictionary["results"] as? [String:Any]{
			results = AlbumResult(fromDictionary: resultsData)
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
         results = aDecoder.decodeObject(forKey: "results") as? AlbumResult

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
