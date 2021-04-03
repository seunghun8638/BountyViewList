//
//  BountyViewController.swift
//  please
//
//  Created by 오승훈 on 2021/03/31.
//

import UIKit

class BountyViewController : UIViewController, UITableViewDataSource,UITableViewDelegate{
 
    //하단 bountyinfo 이용
    let bountyInfoList : [BountyInfo] = [
        BountyInfo(name: "brook",bounty: 3300000),
        BountyInfo(name: "chopper",bounty: 500),
        BountyInfo(name: "franky",bounty: 5500000),
        BountyInfo(name: "luffy",bounty: 30000000),
        BountyInfo(name: "nami",bounty: 1600000),
        BountyInfo(name: "robin",bounty: 8000000),
        BountyInfo(name: "sanji",bounty: 7700000),
        BountyInfo(name: "zoro",bounty: 12000000)
        
    ]
    
//    //커스텀 셀에 들어갈 데이터
//    let nameList = ["brook","chopper","franky","luffy","nami","robin","sanji","zoro"]
//    let bountyList = [33000000,50,44000000,300000000,16000000,8000000,7700000,120000000]

    //기존의 있는 함수여서 override하여 변경
    //seque보내기 직전에 준비 할때 보낼껄 작성하면 된다.
    //이때, detailviewcontroller에게 데이터를 줄거다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{ //segue인데 showdeatil를 보여줄 때,
            //세그웨이 destiantuon -> Viewcontroller -> DetailViewcontroller 임으로
            let vc = segue.destination as? DetailViewController
            //name,bounty 데이터를 넘겨주고 싶은거
            //그래서 몇번 째 인지를 보내야되니.
            //sender가 위에 any? 옵셔널인데 그걸 int(몇번째를 알아야되기 땜에) 다운 캐스팅
            if let index = sender as? Int{
                
                let bountyInfo = bountyInfoList[index]
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
                    vc?.bountyInfo = bountyInfo
                //있으니깐 nameList에 몇번쨰이다라고 보여줌
//                vc?.name = nameList[index]
//                vc?.bounty = bountyList[index]
            }
        }
    }//perfomSegue를 보내기 직전에 준비한다.
    override func viewDidLoad() {
        super.viewDidLoad()
        

        }
        
    
    
    //TableVIew-> DataSource와 Delegate를 BountyViewController에 연결시켜 연동되게 하여 화면에 보여지도록 합니다.
    //UITableVIewDataSource -> 필수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyInfoList.count
//        return nameList.count
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
            
            //bounyInfo를 이용
            let bountyInfo = bountyInfoList[indexPath.row]
            cell.imagView.image = bountyInfo.image
            cell.nameLabel.text = bountyInfo.name
            cell.bountyLabel.text = "\(bountyInfo.bounty)"
            
//            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//            cell.imagView.image = img
//            cell.nameLabel.text = nameList[indexPath.row]
//            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
            
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
        //indexPath.row -> 몇번 쨰 셀이 클릭 되는지 알 수 있다. 그래서 indexPath.row 데이터를 보냄
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
//리펙터링 /,MVVM찾기
//Model -> 현상금에 대한 정보를
//BountInfo 만들기(정보를 하나로 만들기)
struct BountyInfo {
    let name : String
    let bounty : Int
    
    
    var image : UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name : String , bounty : Int) {
        self.name = name
        self.bounty = bounty
    }
}

//View -> 현상금 관련 정보를 보여줌
//ListCell -> 필요한 정보를 ViewModel한테서 받아야겠다.
//ListCell은 ViewModel로 부터 받은 정보를 뷰 업데이트

//ViewModel
//bountyViewModel 만들기 - View에서 필요한 메서드 만들기
//Model 가지고 있기 ->bounty info 를 가지고 있어야 한다.
