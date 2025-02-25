F1::
{
    Send, docker run hello-world ; test to verify Docker install 
}
return

F2::
{
    Send, docker pull wallarm/node ; download latest Wallarm Filtering Node
}
return

F3::
{
    Send, docker run -d --name wallarm-node -p 8080:80 -p 443:443 -e WALLARM_API_HOST="api.wallarm.com" -e WALLARM_MODE="monitoring" -e WALLARM_API_TOKEN="rmmYZy9C8g1xlIEhViNY2sjlqumoe54ofO29I9DXpPw88IPhM8BEoZF1PYXNG7Q0" wallarm/node
; change token accordingly
}
return

F4::
{
    Send, docker ps -a ; verify container is running
}
return

------------------------------------------------------------------

F5::
{
    Send, docker exec -it wallarm-node /bin/bash ; opens shell inside Wallarm Container/avoids using Docker Interface
}
return

F6::
{
    Send, vi /etc/nginx/conf.d/default.conf ; open Nginx config file using vi or nano
}
return

F7::
{
	Send, nginx -s reload ; reload Nginx to apply the configuration
}
return

F8::
{
	Send, docker logs wallarm-node ; check docker logs for node
}
return


