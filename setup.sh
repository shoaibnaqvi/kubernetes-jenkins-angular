PROJECT_ROOT=$(pwd) #kubernetes-jenkins-angular path

#setup frontend repository
cd $PROJECT_ROOT
cd ..
git clone git@github.com:shoaibnaqvi/frontend.git
cd "$PROJECT_ROOT/frontend"
npm install

#setup jenkins
cd $PROJECT_ROOT
cd ..
git clone git@github.com:shoaibnaqvi/jenkins.git
./install.sh

#setup kubernetes
cd $PROJECT_ROOT
cd ..
git clone git@github.com:shoaibnaqvi/k8s.git
#deployment to be continued using jenkins