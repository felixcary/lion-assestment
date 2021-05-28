//
//  ViewController.swift
//  LionAssestment
//
//  Created by Felix Cary Giovanni on 28/05/21.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var songTableView: UITableView!
    
    var homeViewModel: HomeViewModel!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        homeViewModel.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        songTableView.register(SongListCell.nib(), forCellReuseIdentifier: SongListCell.cellReuseIdentifier())
    }
    
    private func setupViewModel() {
        homeViewModel.rxEventLoadData
            .subscribe(onNext: { [weak self] in
                guard let weakSelf = self else { return }
                weakSelf.songTableView.reloadData()
            }).disposed(by: disposeBag)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.songListViewParam.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongListCell.cellReuseIdentifier(), for: indexPath) as! SongListCell

        cell.setData(songViewParam: homeViewModel.songListViewParam[indexPath.row])
        return cell
    }
}
