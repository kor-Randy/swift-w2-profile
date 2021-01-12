
import UIKit
import Foundation

class LoginViewController: UIViewController {

    var nameText: String?
    var descriptionText: String?
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2")
        self.nameTextField.text = nameText
        self.descriptionTextField.text = descriptionText
    }
    
    
    


}
