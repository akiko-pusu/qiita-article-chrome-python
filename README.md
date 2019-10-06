## これはなに?

Qiitaの記事で書いたChromeとPythonの組み合わせをチェックするためのDocker関連のファイルです。

- Ref: <https://qiita.com/akiko-pusu/items/86faca0cb9c877896c04>

## サンプル実行

```bash
$ docker-compose build
$ docker-compose run sample
title is Google.  # pythonのスクリプトからの出力。PNGも書き出されます
```

## 環境の確認

20191006時点です。

```bash
$ docker-compose run sample cat /etc/debian_version
10.1
$ docker-compose run sample uname -a
Linux 8931a9eddcc7 4.14.131-linuxkit #1 SMP Fri Jul 19 12:31:17 UTC 2019 x86_64 GNU/Linux
```

一度ビルドしたものを使い回す場合はいいのですが、Dockerfileからの都度のビルドは、時々確認しないとリポジトリ側の組み合わせなどで上手く動かないことがあります。
