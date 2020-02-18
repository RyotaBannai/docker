# docker
## apache でserverを構築する手順
- [基本的にはこのサイトを参考.](https://weblabo.oscasierra.net/docker-httpd-usage/) 
- `docker pull httpd`でapacheのimageをダウンロード
- `docker run -d -p 8080:80 httpd` runするときにポートを少なくともホストos側のポートを指定してあげないと、[後から設定し直すのが大変](https://www.scriptlife.jp/contents/programming/2016/09/07/docker-port-forward/)。仮想os側の方は自動で設定してくれるため、省略しても大丈夫. (**ポートフォワードの設定**)　設定し忘れたときは、再度作り直すのが早い。もし、いろいろ作業してしまっていたら、`docker container commit [container id or name]`でimageを作って、それをもとにcontainer を作成. 追記：**kitematic**の設定から仮想os側のportを変更できるので、それがいい。
- background でサーバサイドのファイル等を走らせたいときは、`docker run -d [container id or name] [favorite command]`とする。例えば、golangのサーバを立ち上げて置きたいならば、`docker run -d exiting_davinci go run /echo/main.go`　などとする.
- ホストosから仮想os側へファイルをコピーしたい場合、`docker container cp ./main.go exiting_davinci:/echo/main.go`のようにする.
- container を作成してたら、httpd imageは自動でapacheを立ち上げてくれるので、containerに入って、何かをする必要はない。もし中に入りたい時は、`docker run **-it**`とする。すでに作成したcontainer なら、`docker container attach [container id name]` または、`docker exec -it [container id or name] bash` container から出るときは、`>>>$ bash`
- windowsでローカルサーバーにアクセスするときに`localhost:8080`だと入れないことがあるので、**実IPアドレスでアクセス**で試してみる。-> [Dockerコンテナで起動したサーバにアクセスできないときの確認と対処方法](https://web.plus-idea.net/on/docker-web-server-access-denied/)　または、kitematicから実行してみると早い。

## すべてのcontainer, images を消す
- `docker rm $(docker ps -a -q)` -> delete all containers.
- `docker system prune -a` -> delet all images.