#### ホストosのvolumeをmountする.
`> docker run --rm --mount type=bind,src=$(pwd),dst=/home/test openjdk:9 cat /home/test/main.java`
#### containerに入ってコンパイルするのはめんどくさいので、コンパイルもついでに行う.
`> docker run --rm --mount type=bind,src=$(pwd),dst=/home/test --workdir=/home/test openjdk:9 java main` ("$PWD"ダブルクオートでもok.)
- ファイルを実行するときは作業ディレクトリをしていること.
- コマンドが長くなるときはlinux のaliasを使う.
`> alias java=docker run --rm --mount type=bind,src=$(pwd),dst=/home/test --workdir=/home/test openjdk:9 java`,
`> java main`
- [このサイトで確認](https://www.ogis-ri.co.jp/otc/hiroba/technical/docker/part7.html)