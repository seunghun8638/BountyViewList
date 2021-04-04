//
//  DetailViewController.swift
//  please
//
//  Created by 오승훈 on 2021/04/02.
//

import UIKit

class DetailViewController : UIViewController {
    
    //리펙터링 /,MVVM찾기
    //Model -> 현상금에 대한 정보를
    //BountInfo 만들기(정보를 하나로 만들기)
    
    //View
    //ImageView , nameLavbel,bountyLable
    //View들은 ViewModel를 통해서 구성되기?
    
    //ViewModel
    //DetailViewModel
    //뷰레이어에서 필요한 메서드 만들기
    //모델 가지고 있기(bounty Info)
    
    
    @IBOutlet weak  var imagView: UIImageView!
    @IBOutlet weak  var nameLabel: UILabel!
    @IBOutlet weak  var bountyLabel: UILabel!
    
//    var name : String?
//    var bounty : Int?
//    var bountyInfo : BountyInfo?
    
    let viewModel = DetailViewModel()
    //정보를 받아 Detailviewcontroller 수행 하고 updateUI 실행
    override func viewDidLoad() {
        super.viewDidLoad()
        // 보이기 바로 직전 호출
        updateUI()
    }
    
    //뷰컨트롤러에서 넘어올때 데이터가 가지고 있다면 Ui컴포넌트에 넣을 수 있다.
    //받아온 정보를 받아 정리하여 updateUI를 실행
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imagView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
        
//        if let name = self.name, let bounty = self.bounty{
//            imagView.image = UIImage(named: "\(name).jpg")
//            nameLabel.text = name
//            bountyLabel.text = "\(bounty)"
//        }
       
        
    }
    //btn 눌렀을 때 뷰컨트롤러가 사라진다.
    @IBAction func close(_ sender: Any) {
        //사라지는 함수 Dismiss
        dismiss(animated: true, completion: nil)
    }
    
    
}

class DetailViewModel {
    var bountyInfo : BountyInfo?
    
    func update(model : BountyInfo?) {
        bountyInfo = model
    
}

}
