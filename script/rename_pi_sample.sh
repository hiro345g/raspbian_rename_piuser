ouid="pi"
nuid="pi001"
/usr/sbin/usermod -l ${nuid} ${ouid}
[ -h /home/pi ] && /bin/rm /home/pi
/usr/sbin/usermod -d /home/${nuid} -m ${nuid}
/usr/sbin/groupmod -n ${nuid} ${ouid}
/bin/sed -E -i "s/^${ouid} /${nuid} /" /etc/sudoers.d/010_pi-nopasswd
/bin/sed -E -i "s/--autologin ${ouid} /--autologin ${nuid} /" /etc/systemd/system/autologin@.service
/bin/sed -E -i "s/autologin-user=${ouid}$/autologin-user=${nuid}/" /etc/lightdm/lightdm.conf
/bin/sed -i "s/:${ouid};/:${nuid};/" /etc/polkit-1/localauthority.conf.d/60-desktop-policy.conf
if [ ${nuid} = "pi" ]; then
  :  # do nothing
else
  if [ ! -e /home/pi ]; then
    /bin/ln -s /home/${nuid} /home/pi
  fi
fi
[ -f /var/spool/cron/crontabs/${ouid} ] && /bin/mv /var/spool/cron/crontabs/${ouid} /var/spool/cron/crontabs/${nuid}
[ -f /var/spool/mail/${ouid} ] && /bin/mv /var/spool/mail/${ouid} /var/spool/mail/${nuid}
[ -e /etc/rc.local.backup ] && /bin/cp /etc/rc.local.backup /etc/rc.local && /bin/rm /etc/rc.local.backup && /sbin/reboot
exit 0
