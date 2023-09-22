TBD

## Non-Prod

Passing in the Proxy variables which are stored in a separate file.

`helm3 install proxy-test-chart -f proxy-test-chart/non-prod-proxy-config.yaml -n proxy-test --namespace proxy-test --tls`

```
LAST DEPLOYED: Fri Aug 23 05:19:54 2019
NAMESPACE: proxy-test
STATUS: DEPLOYED

RESOURCES:
==> v1beta2/Deployment
NAME                         DESIRED  CURRENT  UP-TO-DATE  AVAILABLE  AGE
proxy-test-proxy-test-chart  1        1        1           0          1s

==> v1/Pod(related)
NAME                                         READY  STATUS             RESTARTS  AGE
proxy-test-proxy-test-chart-8d7fb8cdc-kpmrs  0/1    ContainerCreating  0         1s

==> v1/Service
NAME                         TYPE       CLUSTER-IP  EXTERNAL-IP  PORT(S)  AGE
proxy-test-proxy-test-chart  ClusterIP  10.10.10.3  <none>       80/TCP   1s
```

```
asorochtej@ag1sr1ljmp01:~/Platform-Automation-scripts-templates/tools/proxy-test$ kubectl get all -n proxy-test
NAME                                              READY   STATUS    RESTARTS   AGE
pod/proxy-test-proxy-test-chart-b475f4765-lxx9x   1/1     Running   0          16s


NAME                                  TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/proxy-test-proxy-test-chart   ClusterIP   10.10.10.3   <none>        80/TCP    80m


NAME                                          DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/proxy-test-proxy-test-chart   1         1         1            1           80m

NAME                                                    DESIRED   CURRENT   READY   AGE
replicaset.apps/proxy-test-proxy-test-chart-b475f4765   1         1         1       42m
```

```
kubectl exec -it proxy-test-proxy-test-chart-b475f4765-lxx9x -n proxy-test -- curl -k -v https://ispw-dash.gravitant.net
* Rebuilt URL to: https://ispw-dash.gravitant.net/
* Uses proxy env variable no_proxy == 'localhost,127.0.0.1,158.87.48.120,w3.apihub.ibm.com,w3.api.ibm.com,w3-dev.ibm.com,w3-03.ibm.com,bluepages.ibm.com,agnsrlnicp1.sr01.ag1.sp.local:8500'
* Uses proxy env variable https_proxy == 'http://100.64.69.4:8080'
*   Trying 100.64.69.4...
* TCP_NODELAY set
* Connected to 100.64.69.4 (100.64.69.4) port 8080 (#0)
* allocate connect buffer!
* Establish HTTP proxy tunnel to ispw-dash.gravitant.net:443
> CONNECT ispw-dash.gravitant.net:443 HTTP/1.1
> Host: ispw-dash.gravitant.net:443
> User-Agent: curl/7.61.1
> Proxy-Connection: Keep-Alive
>
< HTTP/1.1 200 Connection established
<
* Proxy replied 200 to CONNECT request
* CONNECT phase completed!
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /etc/ssl/certs/ca-certificates.crt
  CApath: none
* TLSv1.2 (OUT), TLS handshake, Client hello (1):
* CONNECT phase completed!
* CONNECT phase completed!
* TLSv1.2 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server key exchange (12):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / ECDHE-RSA-AES256-GCM-SHA384
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: C=US; ST=TX; L=Austin; O=International Business Machines Corporation; CN=*.gravitant.net
*  start date: Apr 10 00:00:00 2019 GMT
*  expire date: Jun 18 12:00:00 2021 GMT
*  issuer: C=US; O=DigiCert Inc; CN=DigiCert SHA2 Secure Server CA
*  SSL certificate verify ok.
> GET / HTTP/1.1
> Host: ispw-dash.gravitant.net
> User-Agent: curl/7.61.1
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Fri, 23 Aug 2019 13:43:59 GMT
< Content-Type: text/html; charset=utf-8
< Content-Length: 978
< Connection: keep-alive
< Vary: Accept-Encoding
< Last-Modified: Thu, 22 Aug 2019 22:46:27 GMT
< ETag: "5d5f1b43-3d2"
< Accept-Ranges: bytes
< Strict-Transport-Security: max-age=15724800; includeSubDomains
< Cache-Control: max-age=0, no-cache, no-store, must-revalidate
< Pragma: no-cache
< X-Content-Type-Options: nosniff
< X-Frame-Options: DENY
< X-XSS-Protection: 1; mode=block
<
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta http-equiv="Content-Language" content="en_US" />
  <meta name="google" value="notranslate">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
    if (global === undefined) {
      var global = window;
    }
  </script>
  <title>DevOps Intelligence</title>
  <base href="/">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico">
<link rel="stylesheet" href="styles.0bacc31f6afd1e1c4284.css"></head>
<body>
<div class="container-fluid">
  <app-dash></app-dash>
</div>
<script src="runtime.203c14bbf4f78ca3065a.js"></script><script src="polyfills-es5.1f70dc8c42f5033a2bad.js" nomodule></script><script src="polyfills.763a2de7401242f202a3.js"></script><script src="main.00237212665b54ec56a8.js"></script></body>
</html>
* Connection #0 to host 100.64.69.4 left intact
```

## Production AG SRES 2
`helm3 install proxy-test-chart -f proxy-test-chart/prodag-sres-proxy-config.yaml -n proxy-test --namespace proxy-test --tls`

```NAME:   proxy-test
LAST DEPLOYED: Tue Apr 23 13:03:52 2019
NAMESPACE: proxy-test
STATUS: DEPLOYED

RESOURCES:
==> v1/Pod(related)
NAME                                          READY  STATUS             RESTARTS  AGE
proxy-test-proxy-test-chart-547977748c-scn8j  0/1    ContainerCreating  0         0s

==> v1/ClusterRoleBinding
NAME                          AGE
proxy_test-sa-anyuid-binding  0s

==> v1/Service
NAME                         TYPE       CLUSTER-IP    EXTERNAL-IP  PORT(S)  AGE
proxy-test-proxy-test-chart  ClusterIP  10.10.10.144  <none>       80/TCP   0s

==> v1beta2/Deployment
NAME                         DESIRED  CURRENT  UP-TO-DATE  AVAILABLE  AGE
proxy-test-proxy-test-chart  1        1        1           0          0s


NOTES:
1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace proxy-test -l "app=proxy-test-chart,release=proxy-test" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl port-forward $POD_NAME 8080:80

```
`gzeien@ag1sr1ljmp01:~$ k get all -n proxy-test`

```NAME                                 DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
deploy/proxy-test-proxy-test-chart   1         1         1            1           24s

NAME                                        DESIRED   CURRENT   READY     AGE
rs/proxy-test-proxy-test-chart-547977748c   1         1         1         24s

NAME                                              READY     STATUS    RESTARTS   AGE
po/proxy-test-proxy-test-chart-547977748c-scn8j   1/1       Running   0          24s

NAME                              TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
svc/proxy-test-proxy-test-chart   ClusterIP   10.10.10.144   <none>        80/TCP    24s
```

`gzeien@ag1sr1ljmp01:~$ k exec -it proxy-test-proxy-test-chart-547977748c-scn8j  -n proxy-test  -- curl -k -v https://ispw-dash.gravitant.net`

```* Rebuilt URL to: https://ispw-dash.gravitant.net/
* Uses proxy env variable NO_PROXY == 'localhost,127.0.0.1,158.87.48.43,100.127.128.0,100.127.0.0,mycluster.icp,ag1sr1icp2.sr1.ag1.sp.ibm.local:8500'
* Uses proxy env variable HTTPS_PROXY == 'http://100.64.69.4:8080'
*   Trying 100.64.69.4...
* TCP_NODELAY set
* Connected to 100.64.69.4 (100.64.69.4) port 8080 (#0)
* allocate connect buffer!
* Establish HTTP proxy tunnel to ispw-dash.gravitant.net:443
> CONNECT ispw-dash.gravitant.net:443 HTTP/1.1
> Host: ispw-dash.gravitant.net:443
> User-Agent: curl/7.61.1
> Proxy-Connection: Keep-Alive
>
< HTTP/1.1 200 Connection established
<
* Proxy replied 200 to CONNECT request
* CONNECT phase completed!
* ALPN, offering http/1.1
... ```
