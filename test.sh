getopt_cmd=$(getopt -o m::ha:b:c:d --long mark::,help,after:,befor:,string:,upper -n $(basename $0) -- "$@")
[ $? -ne 0 ] && exit 1
eval set -- "$getopt_cmd"


# if [ $? != 0 ]; then
#     echo "$usageString"
#     exit 1
# fi

# eval set -- "${ARGS}"

# 解析选项
help_str="
Usage: swupdate-generate [OPTIONS]

Options:
  -a, --imagesPath       :set your deb package path
  -b, --keysPath         :set your key path
  -c, --cpio             :generate a swu file through sw-description 
                          sw-description.sig and our deb packages
  -e, --encrypt          :symmetrically encrypted update images
  -h, --help             :print this help message and exit
  -k, --rsa              :generate a private key and a public key with RSA
  -K, --cms              :generate a private key and a public key with CMS
  -s, --sign             :sign sw-description with CMS
"
while [ -n "$1" ]
do
    case "$1" in
        -m|--mark)
            case "$2" in
                "")
                    mark="_"
                    shift ;;
                *)
                    mark="$2"
                    shift ;;
            esac
            ;;
        -h|--help)
            echo -e "$help_str"
            exit ;;
        -a|--after)
            suffix="$2"
            echo $suffix
            shift ;;
        -b|--befor)
            prefix="$2"
            echo $prefix
            shift ;;
        -c|--string)
            base="$2"
            echo $base
            shift ;;
        -d|--upper)
            upper=on
            echo $upper
            ;;
        --) shift
            break ;;
         *) echo "$1 is not an option"
            exit 1 ;;  # 发现未知参数，直接退出
    esac
    shift
done
# 解析参数
# while [ -n "$1" ]
# do
#     names=("${names[@]}" "$1")
#     shift
# done