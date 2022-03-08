# 通过 ipa 获取 info.plist 进而获取版本号
npx app-info-parser -f /Users/chenxiaojie/Desktop/test/花猫云商.ipa
mv ./result.json test/

#通过 result.json 拿到版本号 version
JQ_EXEC=`which jq`
FILE_PATH=test/result.json
version=$(cat $FILE_PATH | ${JQ_EXEC} '.CFBundleShortVersionString' | sed 's/\"//g')
echo 当前ipa版本号：$version 

echo "请输入此版本更新内容:"
read input

#版本更新内容
content=$input

cp test/hmys.plist test/hmys_${version}.plist

cd test

# sed -i '' 's/HMYS_version/${version}/g' hmys_$version.plist

plutil -replace items.metadata.bundle-version -string ${version} hmys_${version}.plist

plutil -replace items.metadata.subtitle -string ${content} hmys_${version}.plist


echo plist文件创建成功。当前版本号：version: $version, 当前版本更新内容 :$content







