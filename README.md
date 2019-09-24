# BubbleUPnP Server docker container
- Ports exposed: 
  `58050/tcp` 
  `58051/tcp` 
  `1900/udp`
  
## How to run
`docker run -it --network host --restart always --name bubbleupnpserver mjimeneznet/docker-bubbleunpnserver:latest`

## How to build
`docker build . -t bubbleupnpserver`
