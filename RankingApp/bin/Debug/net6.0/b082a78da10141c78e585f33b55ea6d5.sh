function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 13323;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 13323 > /dev/null;
done;

for child in $(list_child_processes 67115);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/jerodbrackin/Projects/RankingApp/RankingApp/bin/Debug/net6.0/b082a78da10141c78e585f33b55ea6d5.sh;
