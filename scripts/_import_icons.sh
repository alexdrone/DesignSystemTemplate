#!/bin/bash

icons="src/design/theme/Icons.generated.swift";
rm $icons;
touch $icons;
printf "import UIKit\n\nstruct Icons {\n" >> $icons;
for var in "$@"
do
  source="resources/icons/${var}.pdf"
  if [ ! -f $source ]; then
    echo "icon ${var} not found.";
  else
    echo "→ Adding ${var} to Assets.xcassets...";
    dest="src/Assets.xcassets/${var}.imageset";
    rm -R $dest;
    mkdir $dest;
    cp $source $dest;
    echo "{\"images\" : [{\"idiom\" : \"universal\",\"filename\" : \"${var}.pdf\",\"scale\" : \"1x\"},{\"idiom\" : \"universal\",\"filename\" : \"${var}.pdf\",\"scale\" : \"2x\"},{\"idiom\" : \"universal\",\"filename\" : \"${var}.pdf\",\"scale\" : \"3x\"}],\"info\" : {\"version\" : 1,\"author\" : \"xcode\"},\"properties\" : {\"template-rendering-intent\" : \"template\",\"preserves-vector-representation\" : true}}" > "${dest}/Contents.json";
    printf "  static let ${var} = \"${var}.pdf\"\n" >> $icons;
  fi
done
printf "}\n" >> $icons;
