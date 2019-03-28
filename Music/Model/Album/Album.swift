

import Foundation


class Album : NSObject, NSCoding{

	var artist : String!
	var image : [AlbumImage]!
	var mbid : String!
	var name : String!
	var streamable : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		artist = dictionary["artist"] as? String
		image = [AlbumImage]()
		if let imageArray = dictionary["image"] as? [[String:Any]]{
			for dic in imageArray{
				let value = AlbumImage(fromDictionary: dic)
				image.append(value)
			}
		}
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
		if artist != nil{
			dictionary["artist"] = artist
		}
		if image != nil{
			var dictionaryElements = [[String:Any]]()
			for imageElement in image {
				dictionaryElements.append(imageElement.toDictionary())
			}
			dictionary["image"] = dictionaryElements
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
         artist = aDecoder.decodeObject(forKey: "artist") as? String
         image = aDecoder.decodeObject(forKey :"image") as? [AlbumImage]
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
		if artist != nil{
			aCoder.encode(artist, forKey: "artist")
		}
		if image != nil{
			aCoder.encode(image, forKey: "image")
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
