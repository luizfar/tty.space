kickstart.context 'Mail'

kickstart.package.install postfix

cp files/postfix.cf /etc/postfix/main.cf
newaliases

kickstart.service.enable postfix
kickstart.service.restart postfix

if [ -s new_users.tmp ]; then
 kickstart.info "Sending welcome email for new users"
 mail -s "Welcome to tty.space" $(cat new_users.tmp) < files/welcome.mail
 rm new_users.tmp
fi
