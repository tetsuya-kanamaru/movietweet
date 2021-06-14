### アプリ名：MOVIE TWEET
### アプリ概要：画像や動画を投稿してコメントができるアプリです。

- 機能
  - deviseによるサインアップ、ログイン機能
  - Active Storageを用いた画像及び動画アップロード機能
  - 投稿できるファイルの拡張子を定義付けてます。
  - Ajax通信によるコメント投稿
  - N+1問題対策

---

# テーブル設計

## Usersテーブル

| Column                | type          | Option                        |
| --------------------- | ------------- | ----------------------------- |
| name                  | string        | null: false                   |
| email                 | string        | null: false                   |
| password              | string        | null: false                   |
| password_confirmation | string        | null: false                   |

### Association
- has_many :tweets
- has_many :comments


## Tweetsテーブル

| Column                | type          | Option                         |
| --------------------- | ------------- | ------------------------------ |
| user                  | references    | null: false, foreign_key: true |
| title                 | string        | null: false                    |
| content               | string        |                                |

### Association
- belongs_to :user
- has_many :comments


## Commentsテーブル

| Column                | type          | Option                         |
| --------------------- | ------------- | ------------------------------ |
| user                  | references    | null: false, foreign_key: true |
| tweet                 | references    | null: false, foreign_key: true |
| comment               | text          | null: false                    |

### Association
- belongs_to :user
- belongs_to :tweet


