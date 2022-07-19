import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String = ""
    var totalPictureCount: Int = 0
    var numberOfPicture: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "\(selectedImage) is \(numberOfPicture) of \(totalPictureCount)"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        imageView.image = UIImage(named: selectedImage)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image fount")
            return
        }
        
        
        let vc = UIActivityViewController(activityItems: [image, selectedImage], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
