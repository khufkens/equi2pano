#!/bin/bash
#
# This script allows for easy ingestion
# of existing spherical panorama timelapse
# images into a pano-moment input files.
#
# In particular, convert 120+ equirectangular files
# into pano-moment compatible files
# (half sized equirectangular files).
# [Filenames should not contain spaces]

# set input / output directory
# [no checks at this time, will fail]
input=$1
output=$2

# list all jpg files in an array
# I assume that the directory only contains
# equirectangular 360 spherical files which
# are ordered chronologically (time series)
files=($(ls $input/*.jpg))
nrfiles=${#files[@]}

# check if there are files to process
if [ $nrfiles -le 1 ];
then
 echo "Too few files detected, check input directory!"
 exit 1
fi

# grab the X resolution of the image and
# determine the offset per image step
# (rounded up)
xres=`identify ${files[1]} | cut -d' ' -f3 | cut -d'x' -f1`
offset=`echo "$xres / ( $nrfiles - 1 )" | bc -l | awk '{printf("%d\n",$1 + 0.5)} ' `

# loop over the first 120 files
# regardless of the number of files
# in the directory
f=1
for i in `seq 0 ${offset} ${xres}`;
do	

	# Roll the image while stepping through the files!
	
	# You can change the starting point (or vantage point)
	# by adding another roll offset before the sequential one:
	# e.g. -roll +2600x0 -roll -${i}x0
	#
	# In fast moving acquisitions in single lens setups you are limited
	# to one field-of-view. This is does not apply to spherical cameras
	# which allows you to pick the opposite viewpoint.
	convert ${files[$f]} -roll -${i}+0 -crop 50%x100%+0+0 $output/panomoment_${f}.jpg

	# increase counter
	f=`echo $f + 1 | bc`
	
done

exit 1
