//
//  AddSearchVC.swift
//  Milkyway
//
//  Created by 이윤진 on 2021/01/11.
//

import UIKit


// MARK: - 제보하기 검색 뷰 . 사라질 예정임
class AddSearchVC: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setBackButton()
        setSearchButton()
        // Do any additional setup after loading the view.
    }
    
}

extension AddSearchVC {
    
    func setTextField(){
        
        searchTextField.delegate = self
    }
    
    func setBackButton(){
        
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    
    func setSearchButton(){
        
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
    }
    
    
    @objc func backButtonClicked(){
        
        navigationController?.popViewController(animated: true)
        
    }
    @objc func searchButtonClicked(){
        
        guard let nvc = UIStoryboard(name: "AddSearch", bundle: nil).instantiateViewController(identifier: "AddSearchResultVC") as? AddSearchResultVC else {
            return
        }
        
        //let text = searchTextField.text ?? ""
        //nvc.cafeResult = text
        self.navigationController?.pushViewController(nvc, animated: true)
        
    }

    
}

extension AddSearchVC: UITextFieldDelegate {
    
    
}
