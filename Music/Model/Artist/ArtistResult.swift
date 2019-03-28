

import Foundation


class ArtistResult : NSObject, NSCoding{

	var attr : Artistattr!
	var artistmatches : Artistmatche!
	var opensearchQuery : ArtistOpensearchQuery!
	var opensearchitemsPerPage : String!
	var opensearchstartIndex : String!
	var opensearchtotalResults : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let attrData = dictionary["@attr"] as? [String:Any]{
			attr = Artistattr(fromDictionary: attrData)
		}
		if let artistmatchesData = dictionary["artistmatches"] as? [String:Any]{
			artistmatches = Artistmatche(fromDictionary: artistmatchesData)
		}
		if let opensearchQueryData = dictionary["opensearch:Query"] as? [String:Any]{
			opensearchQuery = ArtistOpensearchQuery(fromDictionary: opensearchQueryData)
		}
		opensearchitemsPerPage = dictionary["opensearch:itemsPerPage"] as? String
		opensearchstartIndex = dictionary["opensearch:startIndex"] as? String
		opensearchtotalResults = dictionary["opensearch:totalResults"] as? String
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
		if artistmatches != nil{
			dictionary["artistmatches"] = artistmatches.toDictionary()
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
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         attr = aDecoder.decodeObject(forKey: "@attr") as? Artistattr
         artistmatches = aDecoder.decodeObject(forKey: "artistmatches") as? Artistmatche
         opensearchQuery = aDecoder.decodeObject(forKey: "opensearch:Query") as? ArtistOpensearchQuery
         opensearchitemsPerPage = aDecoder.decodeObject(forKey: "opensearch:itemsPerPage") as? String
         opensearchstartIndex = aDecoder.decodeObject(forKey: "opensearch:startIndex") as? String
         opensearchtotalResults = aDecoder.decodeObject(forKey: "opensearch:totalResults") as? String

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
		if artistmatches != nil{
			aCoder.encode(artistmatches, forKey: "artistmatches")
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

	}

}
