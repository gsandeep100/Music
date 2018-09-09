//
//  ViewController.swift
//  Music
//
//  Created by Sandeep on 06/09/2018.
//  Copyright © 2018 Sandeep. All rights reserved.
//

import UIKit
import Foundation
extension UITextField {
    func loadDropdownData(data: [String],delegate: MusicDelegate) {
        self.inputView = PickerView(pickerData: data, dropdownField: self,musdelegate: delegate)
    }
}
extension MainViewController: MusicDelegate{
    
    func checkCategoryDidFailed(message: String){
        print(message)
    }
    func checkServerResultFailed(message: String){
        print(message)
    }
    func showData()
    {
        doTableRefresh()
    }
    func selectCategory(category:String)
    {
        self.category.text = category
    }
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var confirm: UIButton!
    let cellReuseIdentifier = "album"
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var categoryText: UITextField!
    @IBOutlet weak var listMusic: UITableView!
    var presenter:MusicPresenter?
    var selectedAlbum:Album?
    var selectedArtist:Artist?
    var selectedTrack:Track?
    let categories = ["artist", "album", "track"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        category.rightView = UIImageView(image: UIImage(named: "arrow"))
        category.rightViewMode = .always
        category.loadDropdownData(data: categories,delegate: self)
        
        self.presenter = MusicPresenter(delegate: self)
        self.listMusic.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        listMusic.delegate = self
        listMusic.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func confirmPressed(sender: UIButton) {
        presenter?.fetchData(category: self.category.text!,categoryText: self.categoryText.text!)
    }

    @IBAction func textFieldAction(sender: UITextField) {
        presenter?.fetchData(category: self.category.text!,categoryText: self.categoryText.text!)
    }
    
    func doTableRefresh()
    {
        DispatchQueue.main.async() {
            self.listMusic.reloadData()
            return
        }
    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(category.text == "album")
        {
            if ((presenter?.rootClassAlbum?.results?.albummatches?.album?.count)) == nil
            {
                return 0
            }
            return (presenter!.rootClassAlbum?.results?.albummatches?.album?.count)!
        }
        if(category.text == "artist")
        {
            if ((presenter?.rootClassArtist?.results?.artistmatches?.artist?.count)) == nil
            {
                return 0
            }
            return (presenter!.rootClassArtist?.results?.artistmatches?.artist?.count)!
        }
        if(category.text == "track")
        {
            if ((presenter?.rootClassTrack?.results?.trackmatches?.track?.count)) == nil
            {
                return 0
            }
            return (presenter!.rootClassTrack?.results?.trackmatches?.track?.count)!
        }
        return 0
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.listMusic.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        // set the text from the data model
        if(category.text == "album")
        {
            cell.textLabel?.text = (presenter?.rootClassAlbum?.results.albummatches.album[indexPath.row])?.name
        }
        if(category.text == "artist")
        {
            cell.textLabel?.text = (presenter?.rootClassArtist?.results.artistmatches.artist[indexPath.row])?.name
        }
        if(category.text == "track")
        {
            cell.textLabel?.text = (presenter?.rootClassTrack?.results.trackmatches.track[indexPath.row])?.name
        }
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAlbum = nil
        selectedArtist = nil
        selectedTrack = nil
        if(category.text == "album")
        {
            selectedAlbum = (presenter?.rootClassAlbum?.results.albummatches.album[indexPath.row])!
        }
        if(category.text == "artist")
        {
            selectedArtist = (presenter?.rootClassArtist?.results.artistmatches.artist[indexPath.row])!
        }
        if(category.text == "track")
        {
            selectedTrack = (presenter?.rootClassTrack?.results.trackmatches.track[indexPath.row])!
        }
        self.performSegue(withIdentifier: "musicDetail", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "musicDetail" {
            if let toViewController = segue.destination as? MusicDetailViewController {
                toViewController.selectedAlbum = self.selectedAlbum
                toViewController.selectedArtist = self.selectedArtist
                toViewController.selectedTrack = self.selectedTrack
            }
        }
    }
}

