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

   インストール場所は任意です。

5. XC32コンパイラインストール

   [XC32 Compiler Windows版インストーラ(v4.10)](https://ww1.microchip.com/downloads/aemDocuments/documents/DEV/ProductDocuments/SoftwareTools/xc32-v4.10-windows-x64-installer.exe)をダウンロードし、XC32コンパイラをインストールします。

   インストール場所は`C:\workspace\tools\Microchip\xc32`です。

6. GNU CoreUtilsインストール

   [CoreUtils for Windows版インストーラ](https://gnuwin32.sourceforge.net/downlinks/coreutils.php)をダウンローし、CoreUtils for Windowsをインストールします。

   対応バージョンは5.3.0で、インストール場所は`C:\workspace\tools\GnuWin32`です。

   環境変数を手動でセットします。

7. GNU Makeインストール

   [Make for Windows版インストーラ](https://gnuwin32.sourceforge.net/downlinks/make.php)をダウンローし、Make for Windowsをインストールします。

   対応バージョンは3.81で、インストール場所は`C:\workspace\tools\GnuWin32`です。

   環境変数を手動でセットします。

8. Gitインストール

   [git windows版インストーラ](https://gitforwindows.org/)をダウンロードし、gitをインストールします。

   インストール場所は任意です。

9. ファームウェア書き込みツールインストール

   MegaChips GitHubリポジトリから[ファームウェア書き込みツール](https://github.com/MegaChips/flash_write)を取得します。

   展開場所は`C:\workspace\tools\flash_write`です。

   ```
   cd C:\workspace\tools
   git clone https://github.com/MegaChips/flash_write
   ```

10. OpenOCDインストール

   [MegaChips OpenOCDリポジトリ](https://github.com/MegaChips/openocd/releases/tag/v0.12.0-mcc)から、実行バイナリ(openocd-mcc-0.12.0-i686-w64-mingw32.tar.gz)とソースコード(Source code (tar.gz))をダウンロードし、tar.gzファイルを展開します。

   展開場所はともに`C:\workspace\tools\openocd`です。

------

##### [重要]

Windows環境ではパス長に制限があるため、インストール場所が指定されているツールの`C:\workspace`以外の場所へのツールインストールは**未サポート**です。

-----