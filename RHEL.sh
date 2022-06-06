#!/bin/bash









WM2="Welcome to the main menu, Select an option below: "


echo $WM2

options=("install")

select opt in "${options[@]}"

do

    case $opt in
        "install")
            echo "Starting the installer"




            sleep 1

            dnf update
            sleep 5


            subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms



            sleep 1
            dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
            sleep 1
            yum update

            sleep 1

            dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm -y


            sleep 1

            dnf install --nogpgcheck https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-$(rpm -E %rhel).noarch.rpm -y

            sleep 1

            dnf update



            sleep 1

            yum install neofetch wget git nano vim ghc.x86_64 -y

            sleep 1

            dnf makecache



            sleep 1

            yum install xorg-x11-server-Xorg xorg-x11-xauth -y

            sleep 1

            yum install libX* -y
            ;;
        "version")
            echo "version 1.0"
            ;;
        *) echo "unknown command - $REPLY";;
    esac
done

