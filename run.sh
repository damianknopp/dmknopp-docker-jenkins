#!/bin/bash

docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:$HOME/jenkins_home dmknopp/jenkins
