
import UIKit
import Foundation

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfile()
    }
    
    private func setProfile(){
        self.nameLabel.text = "지현우"
        self.descriptionLabel.text = "ㅋㅋㅋㅋㅋ"
    }
    
    @IBAction func tappedEditButton(_ sender: Any) {
        self.nameLabel.textColor = .blue
        self.nameLabel.backgroundColor = .yellow
        self.nameLabel.alpha = 0.5
        self.descriptionLabel.text = "크루미션"
    }
    

}
