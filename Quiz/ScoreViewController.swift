import UIKit
 
class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
 
    var correct = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(correct)問正解!"
    }
    
    @IBAction func toTopBtnAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
