//
//  DetailViewController.swift
//  please
//
//  Created by 오승훈 on 2021/04/02.
//

import UIKit

class DetailViewController : UIViewController {
    
    @IBOutlet weak  var imagView: UIImageView!
    @IBOutlet weak  var nameLabel: UILabel!
    @IBOutlet weak  var bountyLabel: UILabel!
    
    var name : String?
    var bounty : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 보이기 바로 직전 호출
        updateUI()
    }
    
    //뷰컨트롤러에서 넘어올때 데이터가 가지고 있다면 Ui컴포넌트에 넣을 수 있다.
    func updateUI() {
        if let name = self.name, let bounty = self.bounty{
            imagView.image = UIImage(named: "\(name).jpg")
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
       
        
    }
    //btn 눌렀을 때 뷰컨트롤러가 사라진다.
    @IBAction func close(_ sender: Any) {
        //사라지는 함수 Dismiss
        dismiss(animated: true, completion: nil)
    }
    
    
}
