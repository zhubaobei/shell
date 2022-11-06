getopt_cmd=$(getopt -o m::ha:b:s:u --long mark::,help,after:,befor:,string:,upper -n $(basename $0) -- "$@")
[ $? -ne 0 ] && exit 1
eval set -- "$getopt_cmd"


# if [ $? != 0 ]; then
#     echo "$usageString"
#     exit 1
# fi

# eval set -- "${ARGS}"

# 解析选项
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
        -s|--string)
            base="$2"
            echo $base
            shift ;;
        -u|--upper)
            upper=on ;;
        --) shift
            break ;;
         *) echo "$1 is not an option"
            exit 1 ;;  # 发现未知参数，直接退出
    esac
    shift
done
# 解析参数
while [ -n "$1" ]
do
    names=("${names[@]}" "$1")
    shift
done