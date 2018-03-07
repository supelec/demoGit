#!/bin/sh
# Add Git
# Script de déploiement de Oracle sur LXD

LOG_INSTALL_DIR=$(pwd)
LOG_INSTALL_FILE=log-deploiement_$(date +%Y%M%d)
LOG_INSTALL=$LOG_INSTALL_DIR/$LOG_INSTALL_FILE

COUNTIPADDR=`ip addr|grep inet|grep -v inet6|grep global|awk '{print $2}'|cut -d '/' -f 1 | wc -l`
LISTIPADDR=`ip addr|grep inet|grep -v inet6|grep global|awk '{print $2}'|cut -d '/' -f 1`


#echo "Liste des adresses IP trouvé (hors 127.O.O.1)"
#echo $LISTIPADDR

# bash liste_ip.sh

echo "Kit de deploiement Oracle / LXD ...Début" #>> $LOG_INSTALL

if [ "$1" != "" ] ; then
	DEFAULT_PWD=$1
	echo "Mot De Passe défini lors du lancement du script = $DEFAULT_PWD" #>> $LOG_INSTALL
else
	DEFAULT_PWD=P@sswOrd 
	echo "Utilisation du mot de passe par defaut = $DEFAULT_PWD" #>> $LOG_INSTALL
fi

echo "Installation de LXD...Début" #>> $LOG_INSTALL
# sh 01_inst_lsd.sh
echo "Installation de LXD...Fin" #>> $LOG_INSTALL

echo "Installation des pré-requis Oracle...Début" #>> $LOG_INSTALL
# sh 02_inst_prereq.sh
echo "Installation des pré-requis Oracle...Fin." #>> $LOG_INSTALL

echo "Installation Oracle...Début" #>> $LOG_INSTALL
# sh 03_inst_installoracle.sh $DEFAULT_PWD
echo "Installation Oracle...Fin." #>> $LOG_INSTALL

echo "Set up Oracle (installation DB)...Début" #>> $LOG_INSTALL
# sh 04_inst_setup_db.sh $DEFAULT_PWD
echo "Set up Oracle (installation DB)...Fin." #>> $LOG_INSTALL

echo "Deploiemnt de  LXD/Oracle...Terminé."  #>> $LOG_INSTALL


