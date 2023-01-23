#!/bin/bash 

for (( i=0 ; i<$1 ; i++ )); 
do
	
    if [ $i -eq 0 ]; then
	chmod +x scr_master.sh
	yes Y|./scr_master.sh
	variable=`cat file |  grep "docker swarm join --token"`
	cd wrk2
	make
else
	
	ssh node$i<<EOT
	git clone https://github.com/svassi04/Ptix-Fork.git
	cd Ptix-Fork
	chmod +x scr_work.sh
	yes Y|./scr_work.sh
	sudo$variable
	cd wrk2
	make
EOT
	
	
fi
done
sudo docker stack deploy --compose-file=docker-compose-swarm.yml SocialNetwork

ssh  node$i "git clone https://github.com/svassi04/Ptix-Fork.git;
cd Ptix-Fork;
chmod +x scr_work.sh;
yes Y|./scr_work.sh;
sudo$variable;
git clone https://github.com/hvolos/profiler.git
cd wrk2;
make;"
python3 scripts/init_social_graph.py --graph=socfb-Reed98;
#cd wrk2;
#make;
ssh  node$i "chmod +x run_post.sh;
run_post.sh 1
"








