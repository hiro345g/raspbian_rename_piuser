# raspbian_rename_piuser

Raspbianの初期設定で登録されているユーザーpiの名前を変更するためのスクリプトです。


# Dependency

シェルスクリプトを使って実装してあります。

動作確認をしたRaspbianの情報は下記のとおりです。

```bash
$ cat /boot/issue.txt 
Raspberry Pi reference 2018-03-13
Generated using pi-gen, https://github.com/RPi-Distro/pi-gen, 00013d7972122d1304aacda8fff5098f073ceb43, stage5
$ cat /etc/os-release 
PRETTY_NAME="Raspbian GNU/Linux 9 (stretch)"
NAME="Raspbian GNU/Linux"
VERSION_ID="9"
VERSION="9 (stretch)"
ID=raspbian
ID_LIKE=debian
HOME_URL="http://www.raspbian.org/"
SUPPORT_URL="http://www.raspbian.org/RaspbianForums"
BUG_REPORT_URL="http://www.raspbian.org/RaspbianBugs"
$ uname -a
Linux raspberrypi 4.14.30-v7+ #1102 SMP Mon Mar 26 16:45:49 BST 2018 armv7l GNU/Linux
```


# Setup

使用方法は次のとおりです。rename_pi_sample.sh、setup.shの処理内容は設定ファイル内の文字列を変更したり、ディレクトリーの簡単な操作をしているだけです。

1. gitコマンドでリポジトリーをクローンします。
2. setup.shへ変更したいユーザー名を指定して実行すると、Raspbianが再起動します。setup.sh内部ではroot権限で処理を実行しています。Raspbianで使えるユーザー名を指定する必要があります。ユーザー名を指定しないとpi001を指定したことになります。
3. Raspbianが再起動すると、新しいユーザー名で自動ログインします。ユーザー名はLXTerminalを起動したときに表示されるプロンプトが「pi@raspberrypi」から「pi001@raspberrypi」となることで確認できます（pi001は1.で指定したユーザー名になります）。

実行例は次のとおりです。ここでは、ユーザー名piをpi002と変更しています。

```bash
$ git clone https://github.com/hiro345g/raspbian_rename_piuser.git
$ cd script 
$ sh setup.sh pi002
```

ここでの、`$ sh setup.sh pi002` は、下記と同等の処理をしていて、scriptにあるrename_pi_sample.shをrename_pi.shというファイル名でコピーして、nuid="pi001"のpi001を使いたいユーザー名にしています。

```bash
$ cat rename_pi_sample.sh | sed 's/nuid="pi001"/nuid="pi002"/' - > rename_pi.sh
$ sh setup.sh
```

現在のユーザー名と変更したいユーザー名をsetup.shへ指定して実行することもできます。例えば、ユーザー名をpiからpi002と変更してあって、それをpiに戻したい場合は次のように実行します。

```bash
$ cd script 
$ sh setup.sh pi002 pi
```

ここでの、`$ sh setup.sh pi002 pi` は、下記と同等の処理をしています。

```bash
$ cat rename_pi_sample.sh | \
    sed 's/ouid="pi"/ouid="pi002"/' - | \
    sed 's/nuid="pi001"/nuid="pi"/' - > rename_pi.sh
$ sh setup.sh
```


# Licence

This software is released under the MIT License, see LICENSE.


# Authors

Hiroshi Koyama


# References

- How to Rename the Default Raspberry Pi User | Unix etc.:http://unixetc.co.uk/2016/01/07/how-to-rename-the-default-raspberry-pi-user/
