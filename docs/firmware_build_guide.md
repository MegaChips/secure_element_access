# ファームウェアビルド手順

## ファームウェアビルド

1. プロジェクト取得

   power shell または コマンドプロンプトを起動します。

   プロジェクトを展開するディレクトリを作成し、作成したディレクトリに移動します。

   ```
   mkdir -p C:\workspace\firmware\
   cd C:\workspace\firmware
   ```

   gitでプロジェクトを取得します。

   ```
   git clone https://github.com/MegaChips/secure_element_access
   ```

2. プロジェクト開始

   VS Codeを起動し、`C:\workspace\firmware\secure_element_access`を開きます。

3. ターミナルプログラム設定

   メニューバーから**ファイル**を選択し、**ユーザ設定**の**設定**を開きます。

   **設定の検索**に**shell**と入力します。

   **Terminal > Integrated > Default Profile: Windows**で**Command Prompt**を選択します。

4. プロジェクトビルド

   メニューバーから**ターミナル**を選択し、**ビルドタスクの実行**を実行します。

   ビルドが正常に成功するとファームウェアの実行バイナリとFlashイメージバイナリファイルが生成されます。

   ```
   C:\workspace\firmware\secure_element_access\build\secure_element_access.elf
   C:\workspace\firmware\secure_element_access\build\secure_element_access.bin
   ```
------

##### [重要]

Windows環境ではパス長に制限があるため、インストール場所が指定されているツールの`C:\workspace`以外の場所へのツールインストールは**未検証**です。

-----



## セキュアエレメントアクセスファームウェアのデバッグ

1. Cortex-Debug起動

   左側サイドバーから**実行とデバッグ**を選択し、Cortex-Debugを起動します。

2. ボードリセット

   ボード上のリセットボタンを押下し、ボードをリセットします。

3. 実行バイナリロード

   デバッグ対象ボードに対応したデバッグ構成を選択し、**デバッグの開始**を押下します。

   -----

   [注意]

   以下の条件を満たす場合、正常にデバッグが開始できません。

   実行バイナリロード後に、再度ボードリセットから処理をしてください。

   - 動作可能な実行バイナリがすでに内部Flashに書き込まれてる

   - 電源投入後に初めてデバッグを開始する

   -----

4. デバッグ開始

   **続行**ボタンを押下し、デバッグを開始します。
   
   ステップ実行や変数・メモリダンプ方法に関しては、[Cortex-Debug 公式Wiki](https://github.com/Marus/cortex-debug/wiki)を参照ください。

