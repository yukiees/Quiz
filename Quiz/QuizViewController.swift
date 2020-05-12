import UIKit
 
class QuizViewController: UIViewController {
 
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerBtn1: UIButton!
    @IBOutlet weak var answerBtn2: UIButton!
    @IBOutlet weak var answerBtn3: UIButton!
    @IBOutlet weak var answerBtn4: UIButton!
 
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var quizTotal = 5
    var correctCount = 0
 
    override func viewDidLoad() {
        super.viewDidLoad()
        csvArray = loadCSV(fileName: "quiz")
        print(csvArray)
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerBtn1.setTitle(quizArray[2], for: .normal)
        answerBtn2.setTitle(quizArray[3], for: .normal)
        answerBtn3.setTitle(quizArray[4], for: .normal)
        answerBtn4.setTitle(quizArray[5], for: .normal)
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sVC = segue.destination as! ScoreViewController
        sVC.correct = correctCount
    }
 
    @IBAction func btnAction(sender: UIButton) {
        if sender.tag == Int(quizArray[1]) {
            correctCount += 1
            print("正解")
        } else {
            print("不正解")
        }
        print("スコア：\(correctCount)")
        nextQuiz()
    }
 
    func nextQuiz() {
        quizCount += 1
        quizArray.removeAll()
        if quizCount < quizTotal {
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            quizTextView.text = quizArray[0]
            answerBtn1.setTitle(quizArray[2], for: .normal)
            answerBtn2.setTitle(quizArray[3], for: .normal)
            answerBtn3.setTitle(quizArray[4], for: .normal)
            answerBtn4.setTitle(quizArray[5], for: .normal)
        } else {
            performSegue(withIdentifier: "score", sender: nil)
        }
    }
 
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
        } catch {
            print("エラー")
        }
        return csvArray
    }
}
 
