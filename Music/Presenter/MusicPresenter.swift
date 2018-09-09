//
//  MusicPresenter.swift
//  Music
//
//  Created by Sandeep on 08/09/2018.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation
import UIKit
protocol MusicDelegate{
    func showData()
    func checkCategoryDidFailed(message: String)
    func checkServerResultFailed(message: String)
    func selectCategory(category:String)
}

class MusicPresenter
{
    var delegate: MusicDelegate
    let API_KEY = "&api_key=b92e88e20d14802cea3f032878724189"
    let mainUrl = "http://ws.audioscrobbler.com/2.0/?method="
    var rootClassAlbum:AlbumRootClass? = nil
    var rootClassArtist:ArtistRootClass? = nil
    var rootClassTrack:TrackRootClass? = nil
    
    
    init(delegate: MusicDelegate) {
        self.delegate = delegate
    }
    
    func check(categoryText: String){
        if categoryText.isEmpty{
            print("Empty")
            self.delegate.checkCategoryDidFailed(message: "category text can't be blank")
        }
    }
    func fetchData(category:String ,categoryText:String)
    {
        let encodedCategoryText = categoryText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let searchLink = category + ".search"
        let url:String = mainUrl + searchLink + "&" + category + "=" + encodedCategoryText! + API_KEY+"&format=json"
        
        
        URLSession.shared.dataTask(with:URLRequest(url: URL(string: url)!), completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    if(category == "album")
                    {
                        self.taskCallbackAlbum(ret: true, json: json as [String:Any])
                    }
                    if(category == "artist")
                    {
                        self.taskCallbackArtist(ret: true, json: json as [String:Any])
                    }
                    if(category == "track")
                    {
                        self.taskCallbackTrack(ret: true, json: json as [String:Any])
                    }
                    
                } else {
                    if(category == "album")
                    {
                        self.taskCallbackAlbum(ret: false, json: json as [String:Any])
                    }
                    if(category == "artist")
                    {
                        self.taskCallbackArtist(ret: false, json: json as [String:Any])
                    }
                    if(category == "track")
                    {
                        self.taskCallbackTrack(ret: false, json: json as [String:Any])
                    }
                        self.delegate.checkServerResultFailed(message: "Empty Result from Server")
                }
                
            } catch let error as NSError {
                print(error)
            }
        }).resume()
    }
    
    func taskCallbackAlbum(ret:Bool,json:[String:Any])
    {
        self.rootClassAlbum = AlbumRootClass.init(fromDictionary: json )
        delegate.showData()
        if(!ret)
        {
            self.delegate.checkServerResultFailed(message: "category text can't be blank")
        }
    }
    func taskCallbackArtist(ret:Bool,json:[String:Any])
    {
        self.rootClassArtist = ArtistRootClass.init(fromDictionary: json )
        delegate.showData()
        if(!ret)
        {
            self.delegate.checkServerResultFailed(message: "category text can't be blank")
        }
    }
    func taskCallbackTrack(ret:Bool,json:[String:Any])
    {
        self.rootClassTrack = TrackRootClass.init(fromDictionary: json )
        delegate.showData()
        if(!ret)
        {
            self.delegate.checkServerResultFailed(message: "category text can't be blank")
        }
    }
}
