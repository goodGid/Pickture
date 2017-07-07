/*

 
 import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    //모델 역할
    //    let players = ["1","2","3","2","5"] //players added till now
    let players = ["1","2"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //네비게이션 바 컬러
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        //네비게이션 - 텍스트 컬러
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.init(hex: 0xF2D457)]
        navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
        
        
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 700)
        
        
        
        //colletionview xib 연결
        self.collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        //colletionview xib 연결
        self.collectionView.register(UINib(nibName: "CreateTingCell", bundle: nil), forCellWithReuseIdentifier: "Tingcell")
        
        //tablview xib
        self.tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //탭바 숨기지 않음
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    
    
}







//컬렉션 뷰
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    //        //Here you set the number of cell in your collectionView
    //        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //            return max(players.count,numberOfCells);
    //        }
    //
    //         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    //
    //            if((indexPath.row + 1) < self.players.count){ //If index of cell is less than the number of players then display the player
    //
    //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! HomeCollectionViewCell
    ////                cell.labelText.text = self.players[indexPath.row] //Display player
    //                return cell;
    //
    //            }else{//Else display DefaultCell
    //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tingcell", for: indexPath as IndexPath) as! CreateTingCell
    //                return cell;
    //            }
    //        }
    
    
    
    //섹션당 셀 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
        
    }
    
    
    
    //셀 내용
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //        let tingcell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tingcell", for: indexPath) as! CreateTingCell
        //        //
        //                    return tingcell
        
        
        if((indexPath.row + 1) < self.players.count){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
            
            return cell
        }else{
            let tingcell = collectionView.dequeueReusableCell(withReuseIdentifier: "Tingcell", for: indexPath) as! CreateTingCell
            
            return tingcell
        }
        
        
        
    }
    //
    //    private func collectionView(_ collectionView: UICollectionView, willDisplay cell: HomeCollectionViewCell, forItemAt indexPath: IndexPath) {
    //
    //
    //        self.pageControl.currentPage = self.players.count
    //
    //    }
    
    //셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.size.width , height: 300)
    }
    
    
    //셀 선택시
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        print("나의 신청 현황")
        print("선택한 컬렉션 뷰 셀 : \(indexPath.row)")
        
        
        //        let row = indexPath.row
        //        switch(row){
        //        case 0:
        //            let popoverVC = storyboard?.instantiateViewController(withIdentifier: "colorPickerVC") as! ColorPickerViewController
        //            popoverVC.modalPresentationStyle = .popover
        //            popoverVC.preferredContentSize = CGSize(width: 284, height: 446)
        //            if let popoverController = popoverVC.popoverPresentationController {
        //                popoverController.sourceView = self.view
        //                popoverController.sourceRect = CGRect(x: 0, y: 0, width: 85, height: 30)
        //                popoverController.permittedArrowDirections = .any
        //                popoverController.delegate = self
        //                popoverVC.delegate = self
        //            }
        //            present(popoverVC, animated: true, completion: nil)
        //            break
        //        default: break
        
        let row = indexPath.row
        
        if((row + 1) < self.players.count){
            let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ApplyInfoViewController") as! ApplyInfoViewController
            
            
            //네비게이션
            self.navigationController?.pushViewController(nvc, animated: true)
            nvc.navigationItem.title = "나의 신청 현황"
            
            
            //네비게이션 컬
            nvc.navigationController?.navigationBar.tintColor = UIColor.init(hex: 0xF2D457)
            
            //네비게이션 - 텍스트 컬러
            let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.init(hex: 0xF2D457)]
            nvc.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
            
            nvc.navigationController?.navigationBar.barTintColor = UIColor.white
            
            //백 버튼
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            
            
        }else{
            print("맨 마지작 셀은 작동 아됨")
        }
        
        
    }
    
}






//tableview
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        
        
        return cell
    }
    
    
    //tableviewcell heigth
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("내 지역 모집 현황")
        let nvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ApplyRegionViewController") as! ApplyRegionViewController
        
        
        //네비게이션
        self.navigationController?.pushViewController(nvc, animated: true)
        nvc.navigationItem.title = "내 지역 모집 현황"
    }
    
}
 
 */
