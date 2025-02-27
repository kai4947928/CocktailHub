import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab-pagination"
export default class extends Controller {
  static targets = [ "tab" ]

  connect() {
    this.updateTabState()
  }

  // タブがクリックされたときの処理
  changeTab(event) {
    const tabLink = event.target
    const currentTab = new URL(window.location.href)

    // 現在のページ番号を取得
    const pageParam = currentTab.searchParams.get('official_page') || currentTab.searchParams.get('post_page')

    // クリックされたタブに基づいてURLを更新
    if (tabLink.getAttribute('href') === '#official') {
      currentTab.searchParams.set('official_page', pageParam)
    } else if (tabLink.getAttribute('href') === '#post') {
      currentTab.searchParams.set('post_page', pageParam)
    }

    // URLを更新して、ブラウザの履歴に反映
    history.pushState(null, '', currentTab.href)
    this.updateTabState()
  }

  // タブの状態を更新する処理
  updateTabState() {
    const currentTab = new URL(window.location.href)
    const officialPage = currentTab.searchParams.get('official_page')
    const postPage = currentTab.searchParams.get('post_page')

    // 公式タブと投稿タブのリンクを取得
    const officialTab = this.tabTargets.find(tab => tab.getAttribute('href') === '#official')
    const postTab = this.tabTargets.find(tab => tab.getAttribute('href') === '#post')

    // 公式タブが選択されている状態にする
    if (officialPage) {
      officialTab.classList.add('active')
      postTab.classList.remove('active')
    } else if (postPage) {
      postTab.classList.add('active')
      officialTab.classList.remove('active')
    }
  }
}
