
import UIKit
import Foundation

class EditViewController: UIViewController {

    var nameText: String?
    var descriptionText: String?
    var profileImage: UIImage?
    weak var delegate: ProfileDelegate?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    lazy var imagePicker : UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initImageView()
        initProfileInfo()
    }
    
    private func initProfileInfo(){
        self.nameTextField.text = nameText
        self.descriptionTextField.text = descriptionText
        self.profileImageView.image = profileImage
    }
    
    private func initImageView(){
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileImageView.roundView(by: 10)
        self.profileImageView.setBorder(thick: 0.5, color: UIColor.black.cgColor)
    }
    
    @IBAction func tappedCameraButton(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tappedCancelButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func tappedDoneButton(_ sender: Any) {
        delegate?.editProfile(image: self.profileImageView.image, name: self.nameTextField.text ?? "이름", description: self.descriptionTextField.text ?? "설명")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}

extension EditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //취소 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //이미지 선택 시
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.profileImageView.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}
