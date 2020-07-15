# devops2

#Build continer
docker build -t footgo:1.0.0 ~/devops2

#Run continer
docker run -p 8080:8080 footgo:1.0.0

Connect to site Localhost:8080
