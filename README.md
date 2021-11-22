<!-- markdownlint-disable first-line-h1 -->
[![Test](https://github.com/road-master/radiko-podcast/workflows/Test/badge.svg)](https://github.com/road-master/radiko-podcast/actions?query=workflow%3ATest)

# クイックリファレンス

- **Python**:

  [Welcome to Python.org](https://www.python.org/)

  [Python 3 Documentation](https://docs.python.org/3/)

- **FFmpeg**:

  [FFmpeg](https://ffmpeg.org/)

  [ffmpeg - Docker Hub](https://hub.docker.com/r/jrottenberg/ffmpeg)

- **radiko Podcast**:

  [radikopodcast · PyPI](https://pypi.org/project/radikopodcast/)

  [road-master/radiko-podcast: Automatic archiver for radiko program which queried by YAML file.](https://github.com/road-master/radiko-podcast)

<!-- markdownlint-disable no-trailing-punctuation -->
# radiko Podcast とは
<!-- markdownlint-enable no-trailing-punctuation -->

タイムフリー 1 週間では足りない人向けの radiko 番組自動アーカイブコマンドです

# このイメージの使い方

1\.

`config.yml` の作成:

```yaml
# エリア ID (詳細は "ISO 3166-2:JP" で検索)
area_id: JP13
# 同時に実行するアーカイブのプロセス数
number_process: 3
# アーカイブするファイルが既に存在した場合、コマンドの実行を停止するかどうか
# true: 既に存在したファイルは上書きせず、他の番組のアーカイブを続けます
# false: コマンドの実行を停止します
stop_if_file_exists: false
# いずれかのキーワードで見つかった番組をアーカイブします
# 検索対象の情報は番組名のみです
keywords:
  - "SAISON CARD TOKIO HOT 100"
  - "K's Transmission"
  - "ROPPONGI PASSION PIT"
  - "カフェイン11"
```

2\.

`output` ディレクトリーの作成

```console
mkdir output
```

3\.

`docker-compose.yml` の作成:

```yaml
---
version: '3.8'
services:
  radiko-podcast:
    image: mstmelody/radiko-podcast
    volumes:
      - ./config.yml:/workspace/config.yml
      - ./output:/workspace/output
```

この時点でディレクトリー構成は次のようになっています:

```text
your-workspace/
+----output/
+----config.yml
+----docker-compose.yml
```

4\.

コマンドの実行:

```console
docker-compose up
```

すると、対象の番組をタイムフリーから検索し、 見つかった番組を output/ ディレクトリーに自動的にアーカイブし続けます

5\.

終了する場合、ターミナルで  `Ctrl + C` を入力します

# License

このイメージに含まれているソフトウェアのライセンス情報を確認してください

すべての Docker イメージと同様に、それらの中には他のライセンスの下にあるソフトウェアも含まれている可能性があります（Bash などのように、ベースディストリビューションまたは含まれている主要なソフトウェアの直接的または間接的な依存関係のもの）

ビルド済みイメージの使用に関して、このイメージの使用が、含まれるすべてのソフトウェアに関連するライセンスに準拠していることを確認するのは、イメージの利用者の責任です
