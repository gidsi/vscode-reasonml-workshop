FROM ubuntu:latest

# update system and add basic packages
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y nodejs npm curl libgl1-mesa-dri libgl1-mesa-glx libpangoxft-1.0-0 libgtk2.0-0 apt-transport-https libxss1 libasound2 git
RUN ln -s /usr/bin/nodejs /usr/bin/node

# add ms sources
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

# install from ms sources
RUN apt-get -y update
RUN apt-get install -y code

# install reason
RUN npm install -g https://github.com/reasonml/reason-cli/archive/beta-v-1.13.7-bin-linux.tar.gz


# add user
ENV HOME /home/vscode
RUN useradd --create-home --home-dir $HOME vscode
RUN chown -R vscode:vscode $HOME
WORKDIR /home/vscode
USER vscode

# add reason plugin to vscode
RUN code --install-extension freebroccolo.reasonml

# add workshop stuff
RUN git clone https://github.com/sgrove/reactiveconf-2017-reasonml-workshop.git
WORKDIR /home/vscode/reactiveconf-2017-reasonml-workshop/hello-reactive

RUN npm install
# npm start
# npm run webpack # In another tab, since npm start is still running
# code src/simple/page.re # In *another* tab, open vscode from the hello-reactive dir

CMD /bin/bash
