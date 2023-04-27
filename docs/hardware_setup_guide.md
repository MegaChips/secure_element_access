# ハードウェアセットアップ手順

## SparkFun MicroMod mikroBUS Carrier Boardセットアップ

SparkFun MicroMod mikroBUS Carrier BoardにSWD接続用ピンヘッダ(2x5 オス 1.27mmピッチ)を実装します。

## PC接続セットアップ

PCとSparkFun MicroMod mikroBUS Carrier Boardの接続を行います。

1. mikroBUS拡張ボードセット

   Wi-Fi Halow ClickボードとUSB I2C ClickボードをSparkFun MicroMod mikroBUS Carrier Boardにセットします。
   Wi-Fi Halow ClickボードWake信号は、SparkFun MicroMod mikroBUS Carrier BoardのI2C_INTに接続します。

2. JTAG/SWD接続

   1. USB-JTAG変換ボードのSWDとSparkFun MicroMod mikroBUS Carrier BoardのDebug HeaderをSWDケーブルで接続します。

   2. FTDI C232HM-DDHSL-0とJTAG/SWD変換ボードを接続します。


| FTDI C232HM-DDHSL-0ケーブル    | JTAG/SWD変換ボードピン |
| ------------------------------ | ---------------------- |
| <font color="black">黒</font>  | GND                    |
| --                             | RST                    |
| <font color="orange">橙</font> | TCK                    |
| <font color="yellow">黄</font> | TDI                    |
| <font color="green">緑</font>  | TDO                    |
| <font color="red">赤</font>    | VCC                    |

3. UART接続

   PCとUSB I2C ClickボードをUSBケーブルで接続します。