ac-mozc
=======

ac-mozcは[auto-complete](http://cx4a.org/software/auto-complete/) + [Mozc](http://code.google.com/p/mozc/)で日本語入力するためのEmacsプラグインです。

全角/半角モードの切り替え無しに、日本語と半角英数字が混ざった文章を楽に書けることを目標にしています。

インストール
------------

ac-mozcにはauto-completeとmozc.elが必要です。Emacsにこれらがインストールされていて、正しく動作することを確認してください。

ac-mozc.elをダウンロードしてload-pathの通った場所に置いてください。

init.elに以下のように書いてください。

```elisp
(require 'ac-mozc)
(define-key ac-mode-map (kbd "C-c C-SPC") 'ac-mozc-complete)
```

auto-completeの情報源 `ac-sources` に ac-mozcを追加すると日本語を入力できるようになります。  
org-modeにac-mozcを設定する例:

```elisp
(require 'org)
(add-to-list 'ac-modes 'org-mode)
(add-hook 'org-mode-hook 
	  (lambda ()
            (delete 'ac-source-words-in-same-mode-buffers ac-sources)
            (add-to-list 'ac-sources 'ac-source-mozc)
            (set (make-local-variable 'ac-auto-show-menu) 0.2)))
```
- ac-source-words-in-same-mode-buffersは日本語入力に不向きなのでac-sourcesから取り除いた方が良いです。
- ac-auto-show-menuは補完メニューが表示されるまでの時間です。お好みの値を設定してください。

auto-completeの設定方法は、公式の[Auto Complete Modeユーザーマニュアル](http://cx4a.org/software/auto-complete/manual.ja.html)も参照して下さい。

操作方法
--------

基本的にはauto-completeの操作方法そのままです。ac-mozcがauto-completeの情報源として設定されているバッファであれば、普通にタイプすれば日本語の変換候補が現れます。

半角英数字の直後に日本語を入力したい、例えば `Emacs拡張` と入力したい場合は、`Emacs kakucyou` のように間にスペースを1つ入れてください。変換を実行するとスペースが削除されます。undoすると再びスペースが挿入されます。

1文字だけ変換したい場合 (母音、句読点など) は、ac-mozc-completeを実行 (前述の設定通りだと `C-c C-SPC`) してください。

注意
----

ac-mozcの開発は始まったばかりで、いろいろなものが予告なく変更されます。ご了承下さい。
