
import UIKit
import Foundation

protocol ProfileDelegate: class {
    func editProfile(image: UIImage?, name: String, description: String)
}

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfile()
        initImageView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setProfile(){
        self.nameLabel.text = "지현우"
        self.descriptionLabel.text = "ㅋㅋㅋㅋㅋ"
    }
    
    private func initImageView(){
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileImageView.roundView(by: 10)
        self.profileImageView.setBorder(thick: 0.5, color: UIColor.black.cgColor)
    }
    
    @IBAction func tappedEditButton(_ sender: Any) {
        self.nameLabel.textColor = .blue
        self.nameLabel.backgroundColor = .yellow
        self.nameLabel.alpha = 0.5
        self.descriptionLabel.text = "크루미션"
        
        //방법2
//        performSegue(withIdentifier: "ProfileToLogin", sender: nil)
        
        //방법3
        if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditViewController{
            loginVC.delegate = self
            loginVC.nameText = self.nameLabel.text
            loginVC.descriptionText = self.descriptionLabel.text
            loginVC.profileImage = self.profileImageView.image
            present(loginVC, animated: true, completion: nil)
        }
    }
    
    //방법 1, 2
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

extension ProfileViewController: ProfileDelegate{
    func editProfile(image: UIImage?, name: String, description: String) {
        print("name:\(name) , des: \(description)")
        self.profileImageView.image = image
        self.nameLabel.text = name
        self.descriptionLabel.text = description
    }
}
