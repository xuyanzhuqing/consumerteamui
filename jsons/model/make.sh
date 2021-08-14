# 在 lib/models 下生成对应的dart 类 https://pub.dev/packages/json_to_model#installation

workdir=$(cd $(dirname $0); pwd)

# mysql 对应 dart 类型数据默认值
declare -A defaults
defaults["number"]="0"
defaults["string"]="\"\""
defaults["datetime"]="\"@datetime\""

#  参数面板
if [[ $1 = "--help" ]] || [[ $1 = "-h" ]]
then
    echo "Usage: mask.sh [options] [ script.csv ]"
    echo ""
    echo "./mask.sh -h, --help"
    echo "./mask.sh -f, --file [filePath]"
    echo ""
    echo "支持数据库导出表 csv 文件转成 js_to_model 需要的格式"
    echo "参考： https://pub.dev/packages/json_to_model#examples"
    exit 0
elif [[ $1 = "--file" ]] || [[ $1 = "-f" ]]
then
  if [$2 = ""]
  then
    echo "[filePath] can not be empty"
    exit 0
  fi
else
  echo "not support option"
  exit 0
fi

filePath="$2"
fileSuffix=".csv"
fileName="${filePath/$fileSuffix/""}"


# 清空 json 文件
parentDir=".."
targetPath="${parentDir}/${fileName}.json"
if [ -f "$targetPath" ]; then > ${targetPath}; fi

echo "{" > ${targetPath}

lines=()
index=0

while read line
do
  row=(${line//,/ })
  field=${row[0]}
  type=${row[1]}
  required=${row[2]}
  res1="\"${field}"
  res2=""
  # 是否必须
  if [[ $required =~ "YES" ]]; then res2="?\":" >> ${targetPath}; fi
  if [[ $required =~ "NO" ]]; then res2="\":" >> ${targetPath}; fi

  # 类型处理
  res3="\"$type\""

  if [[ $type =~ "bigint" ]];then res3=${defaults["number"]} ;fi
  if [[ $type =~ "varchar" ]];then res3=${defaults["string"]} ;fi
  if [[ $type =~ "char" ]];then res3=${defaults["string"]} ;fi
  if [[ $type =~ "datetime" ]];then res3=${defaults["datetime"]} ;fi
  if [[ $type =~ "varchar" ]];then res3=${defaults["string"]} ;fi

  res=${res1}${res2}${res3}","
  index=$[index+1]

  # 去除表头
  if (($index == 1)); then continue ;fi

  lines[$index]=${res}
done  < $filePath

# 替换最后一个逗号
tail="${lines[-1]/","/""}"
lines[-1]=$tail

for var in ${lines[@]}
  do
    echo $var >> ${targetPath}
  done

# 输出到文件
echo "}" >> $targetPath


# 以下代码无用，仅仅为是作为提示，可去除
echo ${workdir/"model"/""}${fileName/"."/""}

for ((i=0;$i<=20;i++))
do
  let process=$i*5
  printf "[%-20s]%d%%\r" $b $process
  sleep 0.1
  b=#$b
done
echo

# 生成 dart 对象
read -r -p "是否继续更新 dart 类，或稍后手动更新? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY])
		flutter pub run json_to_model
		;;

    [nN][oO]|[nN])
		echo "No"
       	;;
    *)
		echo "Invalid input..."
		exit 1
		;;
esac

# https://blog.csdn.net/qq_31780525/article/details/104415879
# https://zhuanlan.zhihu.com/p/264346586