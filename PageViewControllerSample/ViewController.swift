import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.mainVC = self
    }
    
}

