#!/bin/bash

## Оновная папка хранение настроек emacs.org
ROOT=/home/elf/Desktop
EMACS_CONFIG_FILE=emacs.org

## Устоновка зависимостей для программы emacs
function install-programm (){
    sudo apt -y install hunspell hunspell-ru ispell aspell aspell-ru
}

## Сборка конфигурации из org-mode файла
function make-emacs-conf (){
    emacs --batch --eval "(progn (require 'org)
    	  (org-babel-load-file \"${ROOT}/${EMACS_CONFIG_FILE}\"))"
}


function install-emacs(){
    echo "install emacs !!!!"
    sudo add-apt-repository ppa:ubuntuhandbook1/emacs
    sudo apt install emacs emacs-common
    install-programm
}


PS3=":>> "

select lng in all make-org-config Quit
do
    case $lng in
        "all")
            install-emacs
	    install-programm
	    make-emacs-conf
	    break
	    ;;
        "make-org-config")
            make-emacs-conf
	    break
	    ;;
        "Quit")
            echo "Quit"
            break;;
        *)
           echo "Ooops";;
    esac
done
