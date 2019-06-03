//
//  ViewController.swift
//  SlideMenuSample
//
//  Created by JW_Macbook on 03/06/2019.
//  Copyright © 2019 JW_Macbook. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 스와이프 셋팅.
        self.setUpSlideMenu()
    }
    
    func setUpSlideMenu() {
        // 1. Side Menu ViewController 만들기
        let sideMenu = SlideViewController(nibName: "SlideViewController", bundle: nil)
        // 2. UISideMenuNavigationController 생성시키기.
        let sideNavigation = UISideMenuNavigationController(rootViewController: sideMenu)
        // 3. 셋팅하기.
        SideMenuManager.default.menuRightNavigationController = sideNavigation
        // 3-1. 열리는 방식 셋팅 (내가 필요한 순서)
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.default.menuAnimationFadeStrength = 0.3 // (뒤에 보이는 정도 흐르기)
        
        // 4. 스와이프 열고 닫기 켜기
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.view)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.view)
    }


    
    /// 우측메뉴 Action
    ///
    /// - Parameter sender:
    @IBAction func rightMenu(_ sender: Any) {
        // 강제 열림 액션.
        present(SideMenuManager.default.menuRightNavigationController!, animated: true, completion: nil)
    }
}


// MARK: - UISideMenuNavigationControllerDelegate
extension ViewController : UISideMenuNavigationControllerDelegate {
    
    func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
    }
    
    func sideMenuDidAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appeared! (animated: \(animated))")
    }
    
    func sideMenuWillDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
    }
    
    func sideMenuDidDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappeared! (animated: \(animated))")
    }
}

