PROJECT_ROOT=$(pwd) #kubernetes-jenkins-angular path

function setup_jenkins() {
  echo "Settig up jenkins."

  docker stop jenkins-blueocean
  docker rm jenkins-blueocean
  #docker image rm myjenkins-blueocean:2.375.1-1
  docker stop jenkins-docker
  docker rm jenkins-docker
  #docker image rm docker:dind

  #setup jenkins
  cd $PROJECT_ROOT
  cd ..
  rm -rf jenkins
  echo "Cloning jenkins"
  git clone git@github.com:shoaibnaqvi/jenkins.git && echo "cloned jenkins" && cd "jenkins" && ./install.sh
}

function setup_frontend() {
  cd $PROJECT_ROOT
  cd ..
  rm -rf frontend
  echo "Cloning frontend"
  git clone git@github.com:shoaibnaqvi/frontend.git && echo "cloned frontend" && cd "frontend" && npm install
  : '
  if lsof -t -i:4200 >/dev/null; then
    echo "Already running frontend found"
    sudo kill $(sudo lsof -t -i:4200)
  else
    echo "Port is free. Starting frontend"
  fi
  ng serve --host 192.168.0.134
  '
}

#setup kubernetes
#cd "$PROJECT_ROOT/.."
#git clone git@github.com:shoaibnaqvi/k8s.git && echo "cloned kubernetes"
#cd "kubernetes"
#deployment to be continued using jenkins

setup_jenkins
setup_frontend
