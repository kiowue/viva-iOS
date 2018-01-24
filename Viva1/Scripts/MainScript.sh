#!/bin/sh

#  MainScript.sh
#  Viva1
#
#  Created by vishwender on 1/18/18.
#  Copyright © 2018 viva. All rights reserved.

# This is main script file. All scripts should be executed from here

ls $SRCROOT/Viva1/Scripts | while IFS= read -r -d $'\0' line; do
chmod u+x $line
done

$SRCROOT/Viva1/Scripts/StoryboardControllers.sh
