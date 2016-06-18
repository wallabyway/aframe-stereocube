# getbrooke.sh 
# brooke and lauren model
# https://gallery.autodesk.com/a360rendering/projects/44243/brooke-and-lauren-model

# tutorial:
# commands used:  curl, imagemagick
# curl https://d1zjbwmh9kbk11.cloudfront.net/a360-rendering/160505/5537/5e7ed87e/imageL.0.jpg -o imageL.0.jpg 
# convert -crop 1024x1024 imageL.0.jpg tempFolder/L.jpg




# goal: download cubemap from render service, resize into 1kx1k jpg faces.  1 folder per cubemap

FOLDERNAME="brooke"

function saveCube {
# in: $1=szUUID, $2=szFOLDER_NAME

	# download images
	curl https://d1zjbwmh9kbk11.cloudfront.net/a360-rendering/$1/imageL.0.jpg -o imageL.0.jpg
	curl https://d1zjbwmh9kbk11.cloudfront.net/a360-rendering/$1/imageR.0.jpg -o imageR.0.jpg

	# extract each cube face (2cubes x 6 = 12 faces)
	mkdir $2L
	convert -crop 1024x1024 imageL.0.jpg $2L/L.jpg
	mkdir $2R
	convert -crop 1024x1024 imageR.0.jpg $2R/L.jpg

}

## list of cubemaps to retrieve
declare -a arr=("160505/5537/5e7ed87e" "160505/1039/001a5178" "160505/1526/e288af23" "160505/2167/daf3248b")

## retrieve the base files
for i in "${!arr[@]}"
do
   #echo "${arr[$i]}" $FOLDERNAME$i 
   saveCube "${arr[$i]}" $FOLDERNAME$i 
done
