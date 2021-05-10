import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Show List of Tracks
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    func configureSongs() {
        songs.append(Song(name: "Mindful Breathing",
                          albumName: "Therapy1",
                          artistName: "Therapy1",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "BodyScan",
                          albumName: "Therapy2",
                          artistName: "Therapy2",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Mindful Check In",
                          albumName: "Therapy3",
                          artistName: "Therapy3",
                          imageName: "cover2",
                          trackName: "song3"))
        
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        
        //configure cell
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else{
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
    //present
    
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
