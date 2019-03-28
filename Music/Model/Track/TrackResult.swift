

import Foundation


class TrackResult : NSObject, NSCoding{

	var attr : Trackattr!
	var opensearchQuery : TrackOpensearchQuery!
	var opensearchitemsPerPage : String!
	var opensearchstartIndex : String!
	var opensearchtotalResults : String!
	var trackmatches : Trackmatche!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let attrData = dictionary["@attr"] as? [String:Any]{
			attr = Trackattr(fromDictionary: attrData)
		}
		if let opensearchQueryData = dictionary["opensearch:Query"] as? [String:Any]{
			opensearchQuery = TrackOpensearchQuery(fromDictionary: opensearchQueryData)
		}
		opensearchitemsPerPage = dictionary["opensearch:itemsPerPage"] as? String
		opensearchstartIndex = dictionary["opensearch:startIndex"] as? String
		opensearchtotalResults = dictionary["opensearch:totalResults"] as? String
		if let trackmatchesData = dictionary["trackmatches"] as? [String:Any]{
			trackmatches = Trackmatche(fromDictionary: trackmatchesData)
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if attr != nil{
			dictionary["@attr"] = attr.toDictionary()
		}
		if opensearchQuery != nil{
			dictionary["opensearch:Query"] = opensearchQuery.toDictionary()
		}
		if opensearchitemsPerPage != nil{
			dictionary["opensearch:itemsPerPage"] = opensearchitemsPerPage
		}
		if opensearchstartIndex != nil{
			dictionary["opensearch:startIndex"] = opensearchstartIndex
		}
		if opensearchtotalResults != nil{
			dictionary["opensearch:totalResults"] = opensearchtotalResults
		}
		if trackmatches != nil{
			dictionary["trackmatches"] = trackmatches.toDictionary()
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         attr = aDecoder.decodeObject(forKey: "@attr") as? Trackattr
         opensearchQuery = aDecoder.decodeObject(forKey: "opensearch:Query") as? TrackOpensearchQuery
         opensearchitemsPerPage = aDecoder.decodeObject(forKey: "opensearch:itemsPerPage") as? String
         opensearchstartIndex = aDecoder.decodeObject(forKey: "opensearch:startIndex") as? String
         opensearchtotalResults = aDecoder.decodeObject(forKey: "opensearch:totalResults") as? String
         trackmatches = aDecoder.decodeObject(forKey: "trackmatches") as? Trackmatche

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if attr != nil{
			aCoder.encode(attr, forKey: "@attr")
		}
		if opensearchQuery != nil{
			aCoder.encode(opensearchQuery, forKey: "opensearch:Query")
		}
		if opensearchitemsPerPage != nil{
			aCoder.encode(opensearchitemsPerPage, forKey: "opensearch:itemsPerPage")
		}
		if opensearchstartIndex != nil{
			aCoder.encode(opensearchstartIndex, forKey: "opensearch:startIndex")
		}
		if opensearchtotalResults != nil{
			aCoder.encode(opensearchtotalResults, forKey: "opensearch:totalResults")
		}
		if trackmatches != nil{
			aCoder.encode(trackmatches, forKey: "trackmatches")
		}

	}

}
