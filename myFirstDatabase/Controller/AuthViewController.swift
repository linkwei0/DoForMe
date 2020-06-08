import UIKit
import Firebase

class AuthViewController: UIViewController {
    
    var signup: Bool = true{
        willSet{
            if newValue{
                titleLabel.text = "Регистрация"
                nameField.isHidden = false
                textLabelLoginAlreadyHave.text = "у вас уже есть аккаунт?"
                btnLogOrReg?.setTitle("Войти", for: .normal)
            }
            else{
                titleLabel.text = "Войти"
                nameField.isHidden = true
                textLabelLoginAlreadyHave.text = ""
                btnLogOrReg?.setTitle("Регистрация", for: .normal)
            }
        }
    }

    @IBOutlet weak var textLabelLoginAlreadyHave: UILabel!
    @IBOutlet weak var btnLogOrReg: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func switchRegLog(_ sender: UIButton) {
        signup = !signup
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Ошибка", message: "Заполните все поля!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension AuthViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = nameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        if (signup){
            if(!name.isEmpty && !email.isEmpty && !password.isEmpty){
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if error == nil{
                        if let result = result{
                            print(result.user.uid)
                            let ref = Database.database().reference().child("users")
                            ref.child(result.user.uid).updateChildValues(["name": name, "email": email])
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                    else {
                        print(error?.localizedDescription)
                    }
                }
            }
            else{
                showAlert()
            }
        }
        else{
            if(!email.isEmpty && !password.isEmpty){
                Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error == nil{
                        self.dismiss(animated: true, completion: nil)
                    }
                    else {
                        print(error, error?.localizedDescription)
                    }
                }
            }
            else{
                showAlert()
            }
        }
        
        return true
    }
}
