import UIKit

class ImageSliderViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! // Connect this outlet to a UICollectionView in your storyboard or create programmatically

    let images = [UIImage(named: "image1"), UIImage(named: "image1"), UIImage(named: "image1")] // Replace with your own images

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the delegate and data source for the collection view
        collectionView.delegate = self
        collectionView.dataSource = self

        // Configure the collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
    }
}

extension ImageSliderViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "w", for: indexPath) as! ImageCell
        cell.imageView.image = images[indexPath.item]
        return cell
    }
}
