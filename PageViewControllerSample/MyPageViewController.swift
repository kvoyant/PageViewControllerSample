import UIKit

class MyPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    //Delegate : 전달자(이벤트 전달자)
    //lazy변수 : 선언시에 메모리 할당을(인스턴스 생성) 하지 않고,
    //          참조시에 (Read, write 시) 메모리 할당을 함.
    //예: 이게 없으면 타이머 같은 걸로 몇초후에 실행하는 방식
    //get 함수를 정의함
    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name:"Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "firstVC")
        let vc2 = sb.instantiateViewController(withIdentifier: "secondVC")
        let vc3 = sb.instantiateViewController(withIdentifier: "thirdVC")

        return [vc1, vc2, vc3]
    }().self

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.dataSource = self as! UIPageViewControllerDataSource
        self.dataSource = self
        
        if let firstVC = viewControllerList.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of:viewController) else {
            return nil
        }
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of:viewController) else {
            return nil
        }
        let afterIndex = vcIndex + 1
        guard viewControllerList.count != afterIndex else {
            return nil
        }
        guard viewControllerList.count >= afterIndex else {
            return nil
        }
        
        return viewControllerList[afterIndex]
    }

}
