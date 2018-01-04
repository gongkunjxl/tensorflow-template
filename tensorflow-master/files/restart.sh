python distributed.py --job_name=ps --task_index=0 > dist.log>&1 &
i=0
ip_arr=($(cat slaves));
ip_len=${#ip_arr[*]};
while [ $i -lt $ip_len ]
do
  echo "python distributed.py --job_name=worker --task_index="$i > tmp_index.sh
  scp -o StrictHostKeyChecking=no /root/tmp_index.sh ${ip_arr[$i]}:/root/example.sh;
  ssh ${ip_arr[$i]} "nohup ./example.sh > dist.log>&1 & ";
  i=$(( $i + 1 ));
done 
