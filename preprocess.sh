#!/usr/bin/bash

docx_files=`ls -1 *.docx 2>/dev/null | wc -l`
odt_files=`ls -1 *.odt 2>/dev/null | wc -l`
latex_files=`ls -1 *.tex 2>/dev/null | wc -l`

if [ $docx_files != 0 ] ; then 
for f in *.docx
    do 
        pandoc "$f" -t markdown --wrap=none --extract-media=assets/images -s -o "${f%.*}.md"
    done
fi

if [ $odt_files != 0 ] ; then 
for f in *.odt
    do 
        pandoc "$f" -t markdown --wrap=none --extract-media=assets/images -s -o "${f%.*}.md"
    done
fi

if [ $latex_files != 0 ] ; then 
for f in *.tex
    do 
        pandoc "$f" -t latex --wrap=none -s -o "${f%.*}.md"
    done
fi
