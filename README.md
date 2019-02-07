# gtg
![gtg_demo](https://user-images.githubusercontent.com/23325839/52403618-7854c700-2b0a-11e9-9b83-24c35d785e7f.gif)

Golden-Time Guardian especially from net surfing like Twitter.

## What is this?
朝の貴重なゴールデンタイムにうっかり非生産的なことをやりそうになった時に「おい、それは違うぞ」と警告してくれるツール。

仕組み:

- ツールは AutoHotkey スクリプトとして実現
- あらかじめ「この時間帯にこのウィンドウがアクティブになったら」「こんな警告を出す」という設定を書いておく
- スクリプトを実行すると常駐し、設定したとおりに動作する

## Requirement
- Windows 7+
- Python 3.6+
- AutoHotkey 1.1.28+

## Install
[AutoHotkey](http://autohotkey.com/) をインストールする。

## How to use
- gtg_sample.ahk をコピーして別ファイルをつくる
- テキストエディタで開き、例に従って設定を書く
- 実行して常駐させる

すると、書いた設定のとおりに指定条件下で指定ウィンドウを使った時に警告が出るはず。

## 警告について
警告とは **視覚的な注意喚起** のこと。

gtg としては以下を用意している。

- ウィンドウを揺らす
- ウィンドウを非アクティブにする
- メッセージダイアログを表示する

他にも（AutoHotkey スクリプトが書けるのなら）自由に拡張できるはず。

## License
[MIT License](LICENSE)

## Author
[stakiran](https://github.com/stakiran)
