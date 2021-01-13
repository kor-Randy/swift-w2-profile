
import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setProfile()
        self.initImageView()
    }
    
    private func setProfile() {
        self.nameLabel.text = "지현우"
        self.descriptionLabel.text = "ㅋㅋㅋㅋㅋ"
    }
    
    private func initImageView() {
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileImageView.roundView(by: 10)
        self.profileImageView.setBorder(thick: 0.5, color: UIColor.black.cgColor)
    }
    
    @IBAction func tappedEditButton(_ sender: Any) {
        if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditViewController {
            loginVC.delegate = self
            loginVC.nameText = self.nameLabel.text
            loginVC.descriptionText = self.descriptionLabel.text
            loginVC.profileImage = self.profileImageView.image
            present(loginVC, animated: true, completion: nil)
        }
    }
}

extension ProfileViewController: ProfileDelegate {
    func editProfile(image: UIImage?, name: String, description: String) {
        self.profileImageView.image = image
        self.nameLabel.text = name
        self.descriptionLabel.text = description
    }
}
