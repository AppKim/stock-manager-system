# Stock-manage-system

## 参考にした記事

下記の URL をご覧ください。

- https://qiita.com/Kyou13/items/be9cdc10c54d39cded15

## ディレクトリ構造

```bash
├── back
│   ├── Dockerfile
│   ├── Gemfile
│   └── Gemfile.lock
│
├── front
│    ├── 下記を参照
│    └── Dockerfile
├── docker-compose.yaml
```

## Front 環境説明

### components について

```
components
└── XXXX            // view単位のディレクトリ(viewが各ページ)
    └── XXXX.vue       // viewで使うコンポーネント
└── Common            // 共通化されたコンポーネントをまとめるディレクトリ（例 ヘッダー、フッダー）
    └── ZZZ.vue       // 共通化されたコンポーネント
```

### views について

```
views
└── XXXX.vue // 各 page を実装するところ（例 商品一覧ページとか）

```

### ディレクトリ構成

```
├─...(探してみてね)
├─src
  ├── assets // コンパイルされないファイル。リセット CSS, Image
  ├── components // 上記の説明参照
  ├── router // 読んでください　ー＞　https://router.vuejs.org/guide/
  ├── store // 読んでください　ー＞　https://vuex.vuejs.org/guide/
  ├── types // 型定義
  ├── utils // Global変数、関数を置くところ
  ├── views // 上記の説明参照
  ├── App.vue // default
  ├── index.css // tailwind 設定
  ├── main.ts // default
  └──  이하생략
├─...(探してみてね)
```

### 技術選定まとめ

- JS 主要ライブラリ : Vue
- 状態管理 : Vuex
- AltJS : TypeScript
- Style : tailwind? vuetify?
- Code Formatter : Prettier
- 静的解析ツール : ESLint
- タスク管理ツール : GitHub

## その他

github などから初めてローカルに持ってきた場合は以下の手順でプロジェクトを開始します

```bash
$ docker-compose run web rails db:create
$ docker-compose run front npm install（できない人はLocalでnpm installを行う。）
$ docker-compose run web rake db:migrate
$ docker-compose run web rake db:seed_fu
$ docker-compose up
```

## 動作確認

https://localhost:3000
![image](https://user-images.githubusercontent.com/46416157/122662912-9bf7a400-d1d1-11eb-9b28-2097899f8e24.png)

https://localhost:8080
![image](https://user-images.githubusercontent.com/46416157/122662945-e24d0300-d1d1-11eb-9ec3-14b89801b6c6.png)
