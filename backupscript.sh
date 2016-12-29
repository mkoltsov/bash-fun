
#/bin/bash

LOGFILE="/nethome/tille/log/backupscript.log"
echo "Starting backups for `date`" >> "$LOGFILE"

buplinux()
{
DIR="/nethome/tille/xml/db/linux-basics/"
TAR="Linux.tar"
BZIP="$TAR.bz2"
SERVER="rincewind"
RDIR="/var/www/intra/tille/html/training/"

cd "$DIR"
tar cf "$TAR" src/*.xml src/images/*.png src/images/*.eps
echo "Compressing $TAR..." >> "$LOGFILE"
bzip2 "$TAR"
echo "...done." >> "$LOGFILE"
echo "Copying to $SERVER..." >> "$LOGFILE"
scp "$BZIP" "$SERVER:$RDIR" > /dev/null 2>&1
echo "...done." >> "$LOGFILE"
echo -e "Done backing up Linux course:\nSource files, PNG and EPS images.\nRubbish removed." >> "$LOGFILE"
rm "$BZIP"
}

bupbash()
{
DIR="/nethome/tille/xml/db/"
TAR="Bash.tar"
BZIP="$TAR.bz2"
FILES="bash-programming/"
SERVER="rincewind"
RDIR="/var/www/intra/tille/html/training/"

cd "$DIR"
tar cf "$TAR" "$FILES"
echo "Compressing $TAR..." >> "$LOGFILE"
bzip2 "$TAR"
echo "...done." >> "$LOGFILE"
echo "Copying to $SERVER..." >> "$LOGFILE"
scp "$BZIP" "$SERVER:$RDIR" > /dev/null 2>&1
echo "...done." >> "$LOGFILE"

echo -e "Done backing up Bash course:\n$FILES\nRubbish removed." >> "$LOGFILE"
rm "$BZIP"
}

DAY=`date +%w`

if [ "$DAY" -lt "2" ]; then
  echo "It is `date +%A`, only backing up Bash course." >> "$LOGFILE"
  bupbash
else
  buplinux
  bupbash
fi


echo -e "Remote backup `date` SUCCESS\n----------" >> "$LOGFILE"