import UIKit
import FileManagementFramework

class ViewController: UIViewController {
    let fileManager = MyFileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newFolder()
        newFile()
    }
    
    func newFolder() {
         fileManager.createNewFolder(folderName: "/NewFolder/")
    }
    
    func newFile() {
        fileManager.createNewFile(folderName: "/NewFolder/", name: "text1.txt")

    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        fileManager.getAndDeleteFiles(folder: "NewFolder", fileType: "txt", expiringTime: 1)
    }
}
