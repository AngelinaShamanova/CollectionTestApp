//
//  ViewController.swift
//  CollectionTestApp
//
//  Created by Angelina on 02.01.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Private properties
    private var collectionView: UICollectionView!
    private var model: Model? = nil
    private var activityIndicator = UIActivityIndicatorView()
    private let networkService = NetworkService()
    private let url = "https://raw.githubusercontent.com/avito-tech/internship/main/result.json"
    private var selectItem = ""
    var showImageIndex: Int?
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        self.networkService.request(urlString: url) { [weak self] (model, error) in
            model?.result.list.map({ _ in
                self?.model = model
                self?.collectionView.isHidden = false
                self?.removeLoad()
                self?.collectionView.reloadData()
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.showLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    
    //MARK: - Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.result.list.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellId, for: indexPath) as! CollectionViewCell
        
        guard let list = model?.result.list[indexPath.item] else { return cell }
        
        cell.configure(with: list)
        
        if showImageIndex == indexPath.row {
            cell.withAnimation = true
            cell.selectedImageView.isHidden = false
            self.selectItem = cell.titleLabel.text ?? ""
        } else {
            cell.selectedImageView.isHidden = true
        }
        
        return cell
    }
    
    //MARK: - Collection View Delegate
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.identifier, for: indexPath) as! FooterView
            footer.configure()
            
            footer.onChoose = {
                let alert = UIAlertController(title: "Вы выбрали услугу:", message: "\(self.selectItem)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            return footer
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier, for: indexPath) as! HeaderView
        header.configure()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showImageIndex = indexPath.row
        self.collectionView.reloadData()
    }
    
    //MARK: - Collection View Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
    
    private func configureUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.size.width - 50, height: 220)
        layout.scrollDirection = .vertical
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.cellId)
        self.collectionView.register(HeaderView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        self.collectionView.register(FooterView.self,
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.identifier)
        self.collectionView.backgroundColor = .white
        self.collectionView.allowsSelection = true
        self.collectionView.allowsMultipleSelection = false
        view.addSubview(collectionView)
    }
}

