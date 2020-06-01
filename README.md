## Install

1- Copy pam scripts
```
sudo cp pam-zoftoken.sh pam-zoftoken-echo.txt /usr/sbin
```

2- Edit pam file /etc/pam.d/common-auth (common-auth-example)
```
auth   [success=1 default=ignore]      pam_exec.so  quiet        /usr/sbin/pam-zoftoken [service] [no_2fa_user] [authkey] [host]
auth   [success=die]                   pam_echo.so     file=/usr/sbin/pam-zoftoken-echo.txt
```