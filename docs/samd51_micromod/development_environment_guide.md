# 開発環境セットアップ手順

## ツールインストール

Windows 10に以下のツール類をインストールします。

1. IDEインストール

   [Visual Studio Code Windows版インストーラ](https://code.visualstudio.com/download)をダウンロードし、Visual Studio Code(VS Code)をインストールします。

   インストール場所は任意です。

2. デバッグ用VS Code拡張機能インストール

   VS Codeを起動し、左側サイドバーから拡張機能を選択します。拡張機能検索バーに`Cortex-Debug`と入力します。

   拡張機能名: Cortex-Debug Publisher: marus25が表示されるので選択しインストールします

3. Python 3.xインストール

   Microsoft Storeを起動し、検索バーに`Python3`と入力します。**Python3.10**を選択しインストールします。

4. CMakeインストール

   [CMake Windows版インストーラ(Latest)](https://cmake.org/download/)をダウンロードし、CMakeをインストールします。

   インストール場所は任意で、インストール時にパスを設定するようにします。

   (**Add CMake to the system PATH for the current user**にチェック)

5. XC32コンパイラインストール

   [XC32 Compiler Windows版インストーラ(v4.10)](https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc32-v4.10-windows-x64-installer.exe)をダウンロードし、XC32コンパイラを**Free**バージョンとしてインストールします。

   インストール場所は`C:\workspace\tools\Microchip\xc32`で、パスを設定する必要はありません。

6. GNU CoreUtilsインストール

   [CoreUtils for Windows版インストーラ](https://gnuwin32.sourceforge.net/downlinks/coreutils.php)をダウンロードし、CoreUtils for Windowsをインストールします。

   対応バージョンは5.3.0で、インストール場所は`C:\workspace\tools\GnuWin32`です。

   環境変数にパスを手動でセットします。(C:\workspace\tools\GnuWin32\bin)

7. GNU Makeインストール

   [Make for Windows版インストーラ](https://gnuwin32.sourceforge.net/downlinks/make.php)をダウンロードし、Make for Windowsをインストールします。

   対応バージョンは3.81で、インストール場所は`C:\workspace\tools\GnuWin32`です。

8. ARM Toolchainインストール

   [ARM Toolchain Windows版インストーラ](https://developer.arm.com/downloads/-/gnu-rm)をダウンロードし、ARM Toolchainをインストールします。

   対応バージョンは10.3-2021.10で、インストール場所は`C:\workspace\tools\ARM_Toolchain`で、パスを設定する必要はありません。

9. Gitインストール

   [git windows版インストーラ](https://gitforwindows.org/)をダウンロードし、gitをインストールします。

   インストール場所は任意です。

10. ファームウェア書き込みツールインストール

    MegaChips GitHubリポジトリから[ファームウェア書き込みツール](https://github.com/MegaChips/flash_write)を取得します。

    展開場所は`C:\workspace\tools\flash_write`です。
       ```
      cd C:\workspace\tools
      git clone https://github.com/MegaChips/flash_write
       ```

11. OpenOCDインストール

     [MegaChips OpenOCDリポジトリ](https://github.com/MegaChips/openocd/releases/tag/v0.12.0-mcc)から、実行バイナリ(openocd-mcc-0.12.0-i686-w64-mingw32.zip)とソースコード(Source code (zip))をダウンロードします。

    1. ソースコード展開

       openocd-0.12.0-mcc.zipを`C:\workspace\tools`に移動させます。zipは`openocd-0.12.0-mcc`ディレクトリに展開されるので、ディレクトリ名を`openocd`にリネームします。

    2. 実行バイナリ展開

       openocd-mcc-0.12.0-i686-w64-mingw32.zipを`C:\workspace\tools\openocd`に移動させます。zipをそのまま展開するとインストールは完了です。

       ```
       C:\workspace\tools\openocd\bin
       C:\workspace\tools\openocd\include
       C:\workspace\tools\openocd\lib
       C:\workspace\tools\openocd\share
       ```

       

------

##### [重要]

Windows環境ではパス長に制限があるため、インストール場所が指定されているツールの`C:\workspace`以外の場所へのツールインストールは**未検証**です。

-----

## FTDI C232HM-DDHSL-0ドライバ更新

FTDI C232HM-DDHSL-0をMPSSE-JTAGで使用するためにドライバを更新します。

1. ドライバの確認

   C232HM-DDHSL-0をPCに接続し、Windowsデバイスマネージャを開きます。
   ポート(COMとLPT)にC232HM-DDHSL-0(COMn)と表示されている場合、2以降の手順でドライバを更新します。
   libusb-win32 deviceにC232HM-DDHSL-0と表示されている場合、ドライバの更新は不要です。

2. ドライバ更新ツール(Zadig)のダウンロード

   [Zadig](https://zadig.akeo.ie/)でC232HM-DDHSL-0のドライバを更新します。
   対応バージョンは2.7以降で、ダウンロード場所は任意です。

3. ドライバ更新

   Zadigを起動します。
   **Option**から**List All Device**にチェックを入れます。
   プルダウンから**C232HM-DDHSL-0**を選択します。
   ドライバのプルダウンから**libusbK**を選択し、**Replace Driver**を押下します。
   ドライバ更新処理が開始されます。
   正常に更新処理が完了すると **The driver was installed successfully.** が表示されます。

4. ドライバの確認

   Windowsデバイスマネージャを開きます。
   libusbK deviceにC232HM-DDHSL-0と表示されることを確認します。
