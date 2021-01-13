
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
    
//    private func addEvent(){
//        let editButtonTap = UITapGestureRecognizer(target: self, action: #selector(self.tappedEditButton_Code))
//        self.editButton.addGestureRecognizer(editButtonTap)
//    }
    
    private func setProfile() {
        self.nameLabel.text = "지현우"
        self.descriptionLabel.text = "ㅋㅋㅋㅋㅋ"
    }
    
    private func initImageView() {
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileImageView.roundView(by: 10)
        self.profileImageView.setBorder(thick: 0.5, color: UIColor.black.cgColor)
    }
    
//    @objc private func tappedEditButton_Code(){
//        self.nameLabel.textColor = .blue
//        self.nameLabel.backgroundColor = .yellow
//        self.nameLabel.alpha = 0.5
//        self.descriptionLabel.text = "크루미션"
//
//        if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditViewController{
//            loginVC.delegate = self
//            loginVC.nameText = self.nameLabel.text
//            loginVC.descriptionText = self.descriptionLabel.text
//            loginVC.profileImage = self.profileImageView.image
//            present(loginVC, animated: true, completion: nil)
//        }
//    }
    
    @IBAction func tappedEditButton(_ sender: Any) {
        // 방법2
//        performSegue(withIdentifier: "ProfileToLogin", sender: nil)
        
        // 방법3
        if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditViewController {
            loginVC.delegate = self
            loginVC.nameText = self.nameLabel.text
            loginVC.descriptionText = self.descriptionLabel.text
            loginVC.profileImage = self.profileImageView.image
            present(loginVC, animated: true, completion: nil)
        }
    }
    
    // 방법 1, 2
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ProfileToLogin"{
//            if let loginVC = segue.destination as? LoginViewController{
//                loginVC.delegate = self
//                loginVC.nameText = self.nameLabel.text ?? "name"
//                loginVC.descriptionText = self.descriptionLabel.text ?? "description"
//            }
//        }
//
//    }
}

extension ProfileViewController: ProfileDelegate {
    func editProfile(image: UIImage?, name: String, description: String) {
        self.profileImageView.image = image
        self.nameLabel.text = name
        self.descriptionLabel.text = description
    }
}
