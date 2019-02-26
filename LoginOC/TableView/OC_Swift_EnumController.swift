//
//  OC_Swift_EnumController.swift
//  LoginOC
//
//  Created by HongpengYu on 2018/11/7.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

import UIKit

class OC_Swift_EnumController: UIViewController {
    
    @objc var type: TestState = .none

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        // Do any additional setup after loading the view.
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(type)
        let typeValue = Int(Float(type.rawValue))
        print(typeValue)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let ocController = SOAPController()
        ocController.state = type
        ocController.dict = ["key" : type]
        self.navigationController?.pushViewController(ocController, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
