

import Foundation


class Trackmatche : NSObject, NSCoding{

	var track : [Track]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		track = [Track]()
		if let trackArray = dictionary["track"] as? [[String:Any]]{
			for dic in trackArray{
				let value = Track(fromDictionary: dic)
				track.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if track != nil{
			var dictionaryElements = [[String:Any]]()
			for trackElement in track {
				dictionaryElements.append(trackElement.toDictionary())
			}
			dictionary["track"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         track = aDecoder.decodeObject(forKey :"track") as? [Track]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if track != nil{
			aCoder.encode(track, forKey: "track")
		}

	}

}
