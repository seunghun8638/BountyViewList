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
    
    //animation 사용 할 곳
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
  
    //    var name : String?
//    var bounty : Int?
//    var bountyInfo : BountyInfo?
    
    let viewModel = DetailViewModel()
    //정보를 받아 Detailviewcontroller 수행 하고 updateUI 실행
    override func viewDidLoad() {
        super.viewDidLoad()
        // 보이기 바로 직전 호출
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //view didLoad시점에는 가운데 viewDidAppear시점에는 오른쪽
        showAnimation()
    }
    //animate 초기값 설정
    private func prepareAnimation() {
//        //x축 위치 변경 , view 기본 width만큼 이동 -> Constant를 이용
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)//namelabel 변경
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)//bountylabel 변경
        //우측에 있고 3배로 큰 상태 180도 돌아간 상태
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
        
    }
    private func showAnimation() {
        nameLabelCenterX.constant = 0
        bountyLabelCenterX.constant = 0
        
//        //update된 내용을 0.3초동안
//        UIView.animate(withDuration: 0.3){
//            self.view.layoutIfNeeded()
//        }
        
//        //자세한 내용
//        UIView.animate(
//            withDuration: 0.3, //-> 진행될건지
//            delay: 0.1, //-> 진행 딜레이
//            options: .curveEaseIn, //-> 애니메이션에대한 옵션
//            animations: {
//            self.view.layoutIfNeeded() //-> 실제 애니메이션 하는 곳
//        }, completion: nil) //-> 애니메이션이 끝나고 몰 할것인가
//
//        //좀더 애니메이션 주기 + 글자 반동 주기
//        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
//            self.view.layoutIfNeeded() //layoutIfNeed() -> 레이아웃을 다시 할 필요가 있다면 다시 해라 애니메이션이 동작
//        }, completion: nil)
//
//        //ImagView animation 추가
//        UIView.transition(with: imagView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        //view자체를 이용
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1//layoutIfNeed() -> 레이아웃을 다시 할 필요가 있다면 다시 해라 애니메이션이 동작
                }, completion: nil)
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1//layoutIfNeed() -> 레이아웃을 다시 할 필요가 있다면 다시 해라 애니메이션이 동작
                }, completion: nil)
        
        UIView.transition(with: imagView, duration: 0.4, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
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
