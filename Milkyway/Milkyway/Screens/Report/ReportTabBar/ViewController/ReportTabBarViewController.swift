//
//  ReportTabBarViewController.swift
//  Milkyway
//
//  Created by soyounglee on 2021/01/02.
//

import UIKit
import XLPagerTabStrip

class ReportTabBarViewController: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        
       
        notificationObserver()
        setupDefaultStyle()
        changeCheck()
        
        
        super.viewDidLoad()
        
    }
    
    
    
    /// 상단 탭바 부분
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let cafeReport = UIStoryboard.init(name: "CafeReportMain", bundle: nil).instantiateViewController(withIdentifier: "CafeReportMainVC") as! CafeReportMainVC
        cafeReport.tabName = "카페 제보"
        
        
        let myReport = UIStoryboard(name: "MyReportMain", bundle: nil).instantiateViewController(withIdentifier: "MyReportMainVC") as! MyReportMainVC
        myReport.tabName = "나의 제보"
        
        
        return [cafeReport, myReport]
    }
    
}



// MARK: - Function
extension ButtonBarPagerTabStripViewController {
    
    func notificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(searchBtnClicked), name: Notification.Name("tapSearch"), object: nil)
    }
    
    
    /// 탭바 UI 설정하는 함수
    func setupDefaultStyle() {
        settings.style.selectedBarBackgroundColor = UIColor(named: "Milky")!
        settings.style.buttonBarBackgroundColor = .clear
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemFont = .systemFont(ofSize: 14)
        settings.style.selectedBarHeight = 3.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor(named: "Milky")!
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
    }
    
    
    /// 상단 탭바 -> 선택에 따라 색상 변경
    func changeCheck() {
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = .gray
            newCell?.label.textColor = UIColor(named: "Milky")!
            
            
        }
    }
    
    
    /// 검색버튼 눌리면 searchVC로 연결
    @objc func searchBtnClicked() {
        print("searchPlease")
        
        guard let nvc = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(withIdentifier:"SearchVC") as? SearchVC else {
            return
        }
        
        self.navigationController?.pushViewController(nvc, animated: true) // 다음 뷰 띄우기
    }
    
    
}



