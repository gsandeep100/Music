
import Foundation


class AlbumResult : NSObject, NSCoding{

	var attr : Albumattr!
	var albummatches : Albummatche!
	var opensearchQuery : AlbumOpensearchQuery!
	var opensearchitemsPerPage : String!
	var opensearchstartIndex : String!
	var opensearchtotalResults : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let attrData = dictionary["@attr"] as? [String:Any]{
			attr = Albumattr(fromDictionary: attrData)
		}
		if let albummatchesData = dictionary["albummatches"] as? [String:Any]{
			albummatches = Albummatche(fromDictionary: albummatchesData)
		}
		if let opensearchQueryData = dictionary["opensearch:Query"] as? [String:Any]{
			opensearchQuery = AlbumOpensearchQuery(fromDictionary: opensearchQueryData)
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
		if albummatches != nil{
			dictionary["albummatches"] = albummatches.toDictionary()
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
         attr = aDecoder.decodeObject(forKey: "@attr") as? Albumattr
         albummatches = aDecoder.decodeObject(forKey: "albummatches") as? Albummatche
         opensearchQuery = aDecoder.decodeObject(forKey: "opensearch:Query") as? AlbumOpensearchQuery
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
		if albummatches != nil{
			aCoder.encode(albummatches, forKey: "albummatches")
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
