

import Foundation


class Artist : NSObject, NSCoding{

	var image : [ArtistImage]!
	var listeners : String!
	var mbid : String!
	var name : String!
	var streamable : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		image = [ArtistImage]()
		if let imageArray = dictionary["image"] as? [[String:Any]]{
			for dic in imageArray{
				let value = ArtistImage(fromDictionary: dic)
				image.append(value)
			}
		}
		listeners = dictionary["listeners"] as? String
		mbid = dictionary["mbid"] as? String
		name = dictionary["name"] as? String
		streamable = dictionary["streamable"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if image != nil{
			var dictionaryElements = [[String:Any]]()
			for imageElement in image {
				dictionaryElements.append(imageElement.toDictionary())
			}
			dictionary["image"] = dictionaryElements
		}
		if listeners != nil{
			dictionary["listeners"] = listeners
		}
		if mbid != nil{
			dictionary["mbid"] = mbid
		}
		if name != nil{
			dictionary["name"] = name
		}
		if streamable != nil{
			dictionary["streamable"] = streamable
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         image = aDecoder.decodeObject(forKey :"image") as? [ArtistImage]
         listeners = aDecoder.decodeObject(forKey: "listeners") as? String
         mbid = aDecoder.decodeObject(forKey: "mbid") as? String
         name = aDecoder.decodeObject(forKey: "name") as? String
         streamable = aDecoder.decodeObject(forKey: "streamable") as? String
         url = aDecoder.decodeObject(forKey: "url") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if image != nil{
			aCoder.encode(image, forKey: "image")
		}
		if listeners != nil{
			aCoder.encode(listeners, forKey: "listeners")
		}
		if mbid != nil{
			aCoder.encode(mbid, forKey: "mbid")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}
		if streamable != nil{
			aCoder.encode(streamable, forKey: "streamable")
		}
		if url != nil{
			aCoder.encode(url, forKey: "url")
		}

	}

}
