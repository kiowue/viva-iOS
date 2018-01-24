#!/bin/sh

#  CommonLib.sh
#  Viva1
#
#  Created by vishwender on 1/18/18.
#  Copyright © 2018 viva. All rights reserved.

function firstCharacterToLower () {

string=$1

first=`echo $string|cut -c1|tr [A-Z] [a-z]`
second=`echo $string|cut -c2-`
result=`echo $first$second`
echo $result
}
