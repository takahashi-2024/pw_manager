#!/bin/bash

echo "パスワードマネージャーへようこそ"
while true; do

	echo -n "次の選択肢から入力してください(Add Password/Get Password/Exit)："
	read choices

	if [ "$choices" = "Add Password" ]; then

		echo -n "サービス名を入力してください："
		read servicename
		echo -n "$servicename," >> password.csv

		echo -n "ユーザー名を入力してください："
		read username
		echo -n "$username," >> password.csv

		echo -n "パスワードを入力してください："
		read password
		echo "$password" >> password.csv

		echo
		echo "パスワードの追加は成功しました"

	elif [ "$choices" = "Get Password" ]; then

		echo "サービス名を入力してください"
		read serch_string

		if grep -q "$serch_string,*,*" password.csv; then

			IFS=','
			set -- $(grep "$serch_string,*,*" password.csv)
			echo "サービス名:$1"
			echo "ユーザー名:$2"
			echo "パスワード:$3"

		else
			echo "そのサービスは登録されていません"

		fi

	elif [ "$choices" = "Exit" ]; then

		echo "Thank you!"
		exit

	else
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"

	fi

done
