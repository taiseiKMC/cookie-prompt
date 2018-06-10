# Cookie-Prompt

これは[魔理沙とアリスのクッキーKiss](http://www.nicovideo.jp/watch/sm9720246)の台詞を
zshのプロンプト表示にするものです

![](https://pbs.twimg.com/media/De08oSrVQAEfNhz.jpg)

# Install

1. zshrcに書き込む
```
cat init.sh >> ~/.zshrc
```
2. zshrcの/path/toを編集する
```
cookie_path="/path/to/cookie-prompt"
```
3. 反映する
```
source ~/.zshrc
```

# Voice
soxを導入し、wavファイルを0001.wavという感じの名前で/cookie-prompt/voices以下に入れ、init.shのコメント部を外すと再生されます

# 素材
## テキスト
- https://www59.atwiki.jp/cokkie_zikkyou/pages/16.html