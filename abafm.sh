#!/bin/bash
function fmmenu() {
	clear
	echo "================================="
	echo "        Welcome to ABAFM!        "
	echo "================================="
	echo "A Better and Amazing File Manager"
	echo "---------------------------------"
	echo "Hit enter to start"
	read
	fm
}

function fm() {
	clear
	echo "==================================="
	echo "Path:" && pwd
	echo "==================================="
	ls
	echo "==================================="
	echo "1) Change directory"
	echo "2) Copy files/folder"
	echo "3) Move files/folder"
	echo "4) Rename files/folder"
	echo "5) Remove file"
	echo "6) Remove folder"
	echo "7) Remove empty folder"
	echo "8) Create folder"
	echo "9) Create file"
	echo "10) View file"
	echo "11) Edit file"
	echo "12) View hidden files"
	echo -n ">>"
	read input
	case $input in
	1)
	echo Choose directory..
	read fmdir
	cd $fmdir
	fm
	;;
	2)
	echo "Choose file/folder to copy.."
	read fmcp1
	echo "Choose destination.."
	read fmcp2
	cp $fmcp1 $fmcp2
	fm
	;;
	3)
	echo "Choose file/folder to move.."
	read fmmv1
	echo "Choose destination.."
	read fmmv2
	mv $fmmv1 $fmmv2
	fm
	;;
	4)
	echo "Choose file/folder to rename.."
	read fmrn1
	echo "Choose new name.."
	read fmrn2
	mv $fmrn1 $fmrn2
	fm
	;;
	5)
	echo "Choose file to delete.."
	read fmrm1
	rm $fmrm1
	fm
	;;
	6)
	echo "Choose folder to delete.."
	read fmrmf
	rm -rf $fmrmf
	fm
	;;
	7)
	echo "Choose empty folder to delete.."
	read fmrmd
	rmdir $fmrmd
	fm
	;;
	8)
	echo "Name your new folder.."
	read fmcrd
	mkdir $fmcrd
	fm
	;;
	9)
	echo "Name your new file.."
	read fmcr
	touch $fmcr
	fm
	;;
	10)
	echo "Choose file to view.."
	read fmv
	clear
	cat $fmv
	echo -n "Hit enter to continue."
	read
	fm
	;;
	11)
	echo "Choose file.."
	read fme
	echo "Choose a text editor:"
	echo "1) Nano"
	echo "2) Vim"
	echo -n ">>"
	read efinp
	case $efinp in
		1)
		nano $fme
		nano_pid=$!
		wait $nano_pid
		fm
		;;
		2)
		vim $fme
		vim_pid=$!
		wait $vim_pid
		fm
		;;
		*)
		echo "Invalid option!"
		sleep 2
		fm
		;;
	esac
	;;
	12)
	fm_all
	;;
	*)
	echo "Invalid option!"
	sleep 2
	fm
	;;
	esac
}

function fm_all() {
	clear
	echo "==================================="
	echo "Path:" && pwd
	echo "==================================="
	ls -a
	echo "==================================="
	echo "1) Change directory"
	echo "2) Copy files/folder"
	echo "3) Move files/folder"
	echo "4) Rename files/folder"
	echo "5) Remove file"
	echo "6) Remove folder"
	echo "7) Remove empty folder"
	echo "8) Create folder"
	echo "9) Create file"
	echo "10) View file"
	echo "11) Edit file"
	echo "12) Hide hidden files"
	echo -n ">>"
	read 2input
	case $2input in
	1)
	echo Choose directory..
	read fmadir
	cd $fmadir
	fm_all
	;;
	2)
	echo "Choose file/folder to copy.."
	read fmacp1
	echo "Choose destination.."
	read fmacp2
	cp $fmacp1 $fmacp2
	fm_all
	;;
	3)
	echo "Choose file/folder to move.."
	read fmamv1
	echo "Choose destination.."
	read fmamv2
	mv $fmamv1 $fmamv2
	fm_all
	;;
	4)
	echo "Choose file/folder to rename.."
	read fmarn1
	echo "Choose new name.."
	read fmarn2
	mv $fmarn1 $fmarn2
	fm_all
	;;
	5)
	echo "Choose file to delete.."
	read fmarm1
	rm $fmarm1
	fm_all
	;;
	6)
	echo "Choose folder to delete.."
	read fmarmf
	rm -rf $fmarmf
	fm_all
	;;
	7)
	echo "Choose empty folder to delete.."
	read fmarmd
	rmdir $fmarmd
	fm_all
	;;
	8)
	echo "Name your new folder.."
	read fmacrd
	mkdir $fmacrd
	fm_all
	;;
	9)
	echo "Name your new file.."
	read fmacr
	touch $fmacr
	fm_all
	;;
	10)
	echo "Choose file to view.."
	read fmav
	clear
	cat $fmav
	echo -n "Hit enter to continue."
	read
	fm_all
	;;
	11)
	echo "Choose file.."
	read fmae
	echo "Choose a text editor:"
	echo "1) Nano"
	echo "2) Vim"
	echo -n ">>"
	read ef2inp
	case $ef2inp in
		1)
		nano $fmae
		nano_pid=$!
		wait $nano_pid
		fm_all
		;;
		2)
		vim $fmae
		vim_pid=$!
		wait $vim_pid
		fm_all
		;;
		*)
		echo "Invalid option!"
		sleep 2
		fm_all
		;;
	esac
	;;
	12)
	fm
	;;
	*)
	echo "Invalid option!"
	sleep 2
	fm_all
	;;
	esac
}

fmmenu
