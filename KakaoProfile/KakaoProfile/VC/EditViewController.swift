
import Foundation
import UIKit

class EditViewController: UIViewController {
    var nameText: String?
    var descriptionText: String?
    var profileImage: UIImage?
    weak var delegate: ProfileDelegate?
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var cameraButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    
    lazy var imagePicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initImageView()
        self.initProfileView()
    }
    
    private func initProfileView() {
        self.nameTextField.text = self.nameText
        self.descriptionTextField.text = self.descriptionText
        self.profileImageView.image = self.profileImage
    }
    
    private func initImageView() {
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileImageView.roundView(by: 10)
        self.profileImageView.setBorder(thick: 0.5, color: UIColor.black.cgColor)
    }
    
    @IBAction func tappedCameraButton(_ sender: Any) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tappedCancelButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        self.delegate?.editProfile(image: self.profileImageView.image, name: self.nameTextField.text ?? "이름", description: self.descriptionTextField.text ?? "설명")
        
        self.dismiss(animated: true)
    }
}

extension EditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}
