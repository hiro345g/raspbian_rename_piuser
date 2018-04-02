# raspbian_rename_piuser

Raspbianの初期設定で登録されているユーザーpiの名前を変更するためのスクリプトです。


# Dependency

シェルスクリプトを使って実装してあります。


# Setup

1. rename_pi.shを編集して、nuid="pi001"のpi001を使いたいユーザー名にする。Raspbianで使えるユーザー名を指定する必要があります。
2. setup.shをroot権限で実行すると、Raspbianが再起動します。
3. Raspbianが再起動すると、新しいユーザー名で自動ログインします。ユーザー名はLXTerminalを起動したときに表示されるプロンプトが「pi@raspberrypi」から「pi001@raspberrypi」となることで確認できます（pi001は1.で指定したユーザー名になります）。

```bash
$ git clone https://github.com/hiro345g/raspbian_rename_piuser.git
$ cd script 
$ sh setup.sh
```

# Licence

This software is released under the MIT License, see LICENSE.


# Authors

Hiroshi Koyama


# References

- How to Rename the Default Raspberry Pi User | Unix etc.:http://unixetc.co.uk/2016/01/07/how-to-rename-the-default-raspberry-pi-user/
