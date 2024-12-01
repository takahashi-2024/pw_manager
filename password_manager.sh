#!/bin/bash

echo -e -n "パスワードマネージャーへようこそ！\nサービス名を入力してください："
read servicename
echo -n "$servicename:" >> password.csv

echo -n "ユーザー名を入力してください："
read username
echo -n "$username:" >> password.csv

echo -n "パスワードを入力してください："
read password
echo "$password" >> password.csv

echo "Thank you!"
