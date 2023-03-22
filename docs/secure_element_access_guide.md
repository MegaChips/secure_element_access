# セキュアエレメントアクセス手順

Wi-Fi Halow Clickのセキュアエレメントにアクセスる場合、[Cortex-Debugでデバッグ](https://github.com/MegaChips/external_flash_access/blob/master/docs/Firmware_build_guide.md)を行うか、ファームウェアバイナリをSparkFun MicroMod mikroBUS Carrier Boardに書き込む必要があります。



## ファームウェアの書き込み

1. ファームウェア書き込みツール起動

   File explorerで`C:\workspace\tools\flash_write`を開きます。

   `flash.bat`を実行し、ファームウェア書き込みツールを起動します。

2. ファームウェアイメージ書き込み

   **Select**ボタンを押下し、`C:\workspace\firmware\secure_element_access\build\secure_element_access.bin`を選択し書き込みを実行します。



## MACアドレス/デバイス証明書の読み出し

1. プロジェクト開始

   VS Codeを起動し、`C:\workspace\firmware\secure_element_access`を開きます。

2. 外部Flash書き込みツール起動

   メニューバーからターミナルを選択し、**タスクの実行**から**secure element reader**タスクを実行し、セキュアエレメントデータ読み出しツールを起動します。

3. ボードリセット

   SparkFun MicroMod mikroBUS carrier Boardの**Reset**ボタンを押下し、ボードをリセットします。

4. データ書き込み

   1. COMポート設定

      USB I2C Clickボードと接続されているCOMポートを選択します。ボーレート、データビット、ストップビットやパリティは自動で設定されます。

   2. 読み出しデータ保存先選択

      **参照**ボタンから、セキュアエレメントから読み出したデータの保存先を選択します。

   3. セキュアエレメントデータ読み出し処理

      **実行**ボタンを押下し、セキュアエレメントからデータ読み出し処理を実行します。



## セキュアブート用公開鍵の書き込み

1. プロジェクト開始

   VS Codeを起動し、`C:\workspace\firmware\secure_element_access`を開きます。

2. 外部Flash書き込みツール起動

   メニューバーからターミナルを選択し、**タスクの実行**から**secure element writer**タスクを実行し、セキュアエレメントデータ書き込みツールを起動します。

3. ボードリセット

   SparkFun MicroMod mikroBUS carrier Boardの**Reset**ボタンを押下し、ボードをリセットします。

4. セキュアブート用公開鍵書き込み

   1. COMポート設定

      USB I2C Clickボードと接続されているCOMポートを選択します。ボーレート、データビット、ストップビットやパリティは自動で設定されます。

   2. セキュアブート用公開鍵選択

      **参照**ボタンから、セキュアエレメントへ書き込む公開鍵ファイルを選択します。

   3. スロットロック選択

      セキュアブート用公開鍵の書き換えを防止する場合、**公開鍵書き込み後にスロットをロックする**をチェックします。

      -----

      [重要]

      スロットをロックした後はアンロックはできません。

      -----

   4. セキュアエレメント書き込み処理

      **実行**ボタンを押下し、セキュアエレメントへのデータ書き込み処理を実行します。