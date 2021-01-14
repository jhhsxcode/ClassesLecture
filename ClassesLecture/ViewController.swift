//
//  ViewController.swift
//  ClassesLecture
//


import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneTextField.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextViewController = segue.destination as! SecondViewController
        
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let str = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        if textField == phoneTextField{

            return checkEnglishPhoneNumberFormat(string: string, str: str)

        }else{

            return true
        }
    }

    func checkEnglishPhoneNumberFormat(string: String?, str: String?) -> Bool{

        if string == ""{ //BackSpace

            return true

        }else if str!.count < 3{

            if str!.count == 1{

                phoneTextField.text = "("
            }

        }else if str!.count == 5{

            phoneTextField.text = phoneTextField.text! + ") "

        }else if str!.count == 10{

            phoneTextField.text = phoneTextField.text! + "-"

        }else if str!.count > 14{

            return false
        }

        return true
    }
    
}

