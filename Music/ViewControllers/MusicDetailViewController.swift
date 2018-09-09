//
//  musicDetail.swift
//  Music
//
//  Created by Sandeep on 08/09/2018.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    fileprivate func downloaded(from url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    fileprivate func downloaded(from link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class MusicDetailViewController: UIViewController
{
    var selectedAlbum:Album?
    var selectedArtist:Artist?
    var selectedTrack:Track?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var artist: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(selectedAlbum != nil)
        {
            if(selectedAlbum?.image[2].text.isEmpty)!
            {
                self.getDefaultImage()
            }
            else
            {
                image.downloaded(from: (selectedAlbum?.image[2].text)!)
            }
            nameLabel.text = selectedAlbum?.name
            artistLabel.text = selectedAlbum?.artist
        }
        else if(selectedArtist != nil)
        {
            if(selectedArtist?.image[2].text.isEmpty)!
            {
                self.getDefaultImage()
            }
            else
            {
                image.downloaded(from: (selectedArtist?.image[2].text)!)
            }
            nameLabel.text = selectedArtist?.name
            artistLabel.isHidden = true
            artist.isHidden = true
            //artistLabel.text = selectedArtist?.listeners
        }
        else if(selectedTrack != nil)
        {
            if(selectedTrack?.image[2].text.isEmpty)!
            {
                self.getDefaultImage()
            }
            else
            {
                image.downloaded(from: (selectedTrack?.image[2].text)!)
            }
            nameLabel.text = selectedTrack?.name
            artistLabel.text = selectedTrack?.artist
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.numberOfLines = 0
    }
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func getDefaultImage() {
        self.image.image = UIImage(named: "noimage")!
    }
    
}
