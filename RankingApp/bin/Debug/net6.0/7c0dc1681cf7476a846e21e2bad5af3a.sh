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

ps 74350;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 74350 > /dev/null;
done;

for child in $(list_child_processes 34324);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/jerodbrackin/Projects/RankingApp/RankingApp/bin/Debug/net6.0/7c0dc1681cf7476a846e21e2bad5af3a.sh;
