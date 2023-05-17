import UIKit

class ImageSliderNViewController: UIViewController {
    
    // MARK: - Properties
    
    let images: [UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image1")!,
        UIImage(named: "image1")!
    ]
    
    var currentIndex: Int = 0
    
    // MARK: - UI Components
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .systemBlue
        pageControl.pageIndicatorTintColor = .systemGray
        return pageControl
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateImageAndPageControl()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -16),
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -306)
        ])
        
        pageControl.numberOfPages = images.count
        pageControl.addTarget(self, action: #selector(pageControlValueChanged(_:)), for: .valueChanged)
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeRightGesture.direction = .right
        view.addGestureRecognizer(swipeRightGesture)
    }
    
    // MARK: - Image and Page Control Update
    
    private func updateImageAndPageControl() {
        imageView.image = images[currentIndex]
        pageControl.currentPage = currentIndex
    }
    
    // MARK: - Gesture Handlers
    
    @objc private func handleSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if gesture.direction == .left {
            currentIndex += 1
            if currentIndex >= images.count {
                currentIndex = 0
            }
        } else if gesture.direction == .right {
            currentIndex -= 1
            if currentIndex < 0 {
                currentIndex = images.count - 1
            }
        }
        
        updateImageAndPageControl()
    }
    
    // MARK: - Page Control Value Changed
    
    @objc private func pageControlValueChanged(_ sender: UIPageControl) {
        currentIndex = sender.currentPage
        updateImageAndPageControl()
    }
}
