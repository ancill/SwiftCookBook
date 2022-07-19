import UIKit

class ViewController: UITableViewController {
    var flagList = [String]() {
        didSet {
            flagList.sort { $0 > $1 }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasSuffix("@2x.png") {
                let endOfSentence = item.index(before: item.firstIndex(of: "@")!)
                let first = String(item[...endOfSentence])
                flagList.append(first)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return flagList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = flagList[indexPath.row]
        
        return cell
    }
    
    
}
