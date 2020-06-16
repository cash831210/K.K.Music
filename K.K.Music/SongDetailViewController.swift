
import UIKit
import AVFoundation

class SongDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var buy_priceLabel: UILabel!
    @IBOutlet weak var sell_priceLabel: UILabel!
    var song: Song?
    var player = AVPlayer()
    var playerItem:AVPlayerItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let buyPrice: Int = song?.buy_price ?? -1
        let sellPrice: Int = song?.sell_price ?? -1
        imageView.image = try? UIImage(data: Data(contentsOf: URL(string: song!.image_uri)!))
        nameLabel.text = song?.name.name_TWzh
        buy_priceLabel.text = buyPrice == -1 ? "無價" : "售價:" + String(buyPrice)
        sell_priceLabel.text = sellPrice == -1 ? "無價" : "售回:" + String(sellPrice)
        
    }
    
    @IBAction func playMusic(_ sender: Any) {
        let musicURL = URL(fileURLWithPath: song!.music_uri)
        playerItem = AVPlayerItem(url: musicURL)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        print("PLAY NOW")
    }
}
