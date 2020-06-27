# ポケモン貯蔵庫

## :arrow_forward: How to get started

Herokuにより下記のURLでデプロイされています。  
https://git.heroku.com/go-go-pokemon-api-server.git  

ローカルに環境構築をしたい場合は、以下のコマンドを叩いてください。

```
$ git clone https://github.com/wafuwafu13/go-go-pokemon-db.git
$ cd go-go-pokemon-db
$ docker-compose build
$ docker-compose run web rake db:create db:migrate
$ docker-compose up -d
```

## :triangular_ruler:  API Specifications

こちらの[API仕様YAML](https://github.com/wafuwafu13/go-go-pokemon-db/blob/master/api-document.yaml)を、[Swagger Editor](https://editor.swagger.io/)で確認してください。

データベースはPostgreSQL、開発環境はDocker、デプロイはHerokuを使用しています。
