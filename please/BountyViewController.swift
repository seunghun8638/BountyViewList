//
//  BountyViewController.swift
//  please
//
//  Created by 오승훈 on 2021/03/31.
//

import UIKit

class BountyViewController : UIViewController, UITableViewDataSource,UITableViewDelegate{
    
    //커스텀 셀에 들어갈 데이터
    let nameList = ["brook","chopper","franky","luffy","nami","robin","sanji","zoro"]
    let bountyList = [33000000,50,44000000,300000000,16000000,8000000,7700000,120000000]
//    let nameBountyList = ["brook":3300000,"chopper" : 50 ,"franky" : 3000000,"luffy" : 160000000,"nami":8000000,"robin":77000000,"sanji":7400000,"zoro": 12000000]
    //세그웨이 보낼려고 하는 직전에  준비하는 함수
    override func prepare(for seque: UIStoryboardSegue,sender : Any?){
        //DetailViewController 데이터 줄꺼야
        if seque.identifier == "showDetail" {
            let vc = seque.destination as? DetailViewController //sender가 넣어준 숫자를 이용해서 nameList 순서에 해당하는걸 detailView로 넘긴다.
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
           
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        }
        
    
    
    //TableVIew-> DataSource와 Delegate를 BountyViewController에 연결시켜 연동되게 하여 화면에 보여지도록 합니다.
    //UITableVIewDataSource -> 필수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
        //boutList 갯수 만큼
    }
    //UITableVIewDataSource -> 필수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ListCell 사용위해 추가 as-> 캐스팅  옵셔널이 될 수 있으니 캐스팅이 안된경우에는 UITableViewCell 넘기도록
        //guard 문 ->  Listcell로 캐스팅한 결과 cell이 nil이 아닌 겨우에 밑으로 코드 수행하고 그렇지 않은 경우에 UITableView로 넘김
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else{
//            return UITableViewCell()
//        }
        //상단 가드문과 if문과 동일
        //차이는 가드문 띄어쓰기가 한번 더 안들어감
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
            cell.imagView.image = img
            cell.nameLabel.text = nameList[indexPath.row]
            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
            
            return cell
        }
        else{
            return UITableViewCell()
        }
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //indexPath -> cell위치를 표시
        
        //checkpoint -> 악세사리
    }
    //UITableVIewDelegate -> 눌럿을 때 출력창에 나옴(선택)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--->\(indexPath.row)")
        //눌렀을 때 연동(세그웨이 : showDetail)
        // 수행해라 performseque
        //showDetail를 이용하여 넘기면 sender-> 넘길것 따로 없으면 nil
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        //sender를 이용해서 정보를 보낼 수 있다.
        //정보를 보내는 시점에 그 정보를 가지고 위로 올라간다.
    }
}
 //custom cell
class ListCell : UITableViewCell {
    //custom cell 추가 3개
    @IBOutlet weak  var imagView: UIImageView!
    @IBOutlet weak  var nameLabel: UILabel!
    @IBOutlet weak  var bountyLabel: UILabel!
    
    
}
