//
//  SongViewController.swift
//  K.K.Music
//
//  Created by 莊鎧旭 on 2020/5/30.
//  Copyright © 2020 Cash. All rights reserved.
//

import UIKit


class SongViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var songs = [Song]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://acnhapi.com/v1/songs")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data, let songsDic = try? decoder.decode([String: Song].self, from: data){
                self.songs = Array(songsDic.values)
                print(self.songs[0].name.name_TWzh)
               
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    print(self.songs.count)
                }
                
            }
            print(error ?? "")
        }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songs.count
       }
       
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SongCollectionViewCell", for: indexPath) as! SongCollectionViewCell

        let song = songs[indexPath.row]
        
        cell.nameLabel.text = song.name.name_TWzh
        if let url = URL(string: songs[indexPath.row].image_uri){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.imageView.image = image
                        print(data)
                    }
                }
                print("Error\(String(describing: error))")
            }.resume()
        }
        cell.imageView.contentMode = .scaleAspectFill
        return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SongDetailViewController") as! SongDetailViewController
        
        vc.song = self.songs[indexPath.item]
        print(vc.song!)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
//    @IBSegueAction func showDetail(_ coder: NSCoder) -> SongDetailViewController? {
//        let controller = SongDetailViewController(coder: coder)
//        if let row = collectionView.indexPathForSelectedRow?.row{
//            controller?.song = songs[row]
//        }
//        return controller
//    }

       
}

 


