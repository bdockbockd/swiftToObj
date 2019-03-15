//
//  ViewController.swift
//  swiftToObejctive
//
//  Created by B2B on 15/3/2562 BE.
//  Copyright © 2562 BB. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    var type: String?
    var info: String?
    var content : [String : Any]? {
        didSet{
            print("is being set")
        }
    }
    var url_string: String = """
https://www.cas.chula.ac.th/cas/service.php?q=api%2FgetStudent&appid=th.ac.chula.eng.cp.mobileprog&appsecret=0a455d685fdf2dec0790817aaaea5096ad4aed64c72b6290e9aef693aa7c61583763eddadb1f26627b39e7d5180069db91833ef18a5d2973f997e9a916023fec&key=6031019821
"""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textField.delegate = self;
    }
    
    func searching () {
        let url = URL(string: url_string)
        if let url = url {
            let task = URLSession.shared.dataTask(with:url) { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    
                } else {
                    do {
                        let parsedData = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
                        if let content = parsedData["content"] {
                            TableViewController.contentArr = content as? [String : Any]
                        }
                        if let type = parsedData["type"] {
                            TableViewController.type = type as? String
                        }
                        if let info = parsedData["info"]{
                            TableViewController.info = info as? String
                        }

                    } catch let error as NSError {
                        print(error.localizedDescription)
                    }
                }
                }
            task.resume()
//            print("content before perform \(self.content)")

        }
       
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("didEndEditing")
        if(self.textField.text == "6031019821") {
            searching()
            self.performSegue(withIdentifier: "showDetail", sender: self)
        } else {
            performSegue(withIdentifier: "showElection", sender: self);
        }

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showElection") {
//            let desVc : ObcViewController? = segue.destination as? ObcViewController
//            if let res = self.textField.text {
//                desVc?.result = res;
//            }
        } else {
//            print("Transferring data")
//            let desVc : TableViewController? = segue.destination as? TableViewController
//            if let type = self.type, let info = self.info, let content = self.content {
//                desVc?.type = type
//                desVc?.info = info
//                desVc?.contentArr = content
//                print(content)
//            }
//            print(self.content)
        }
    }


}

