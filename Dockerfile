FROM linuxserver/ubooquity
RUN \
	echo "Backing up 'Ubooquity.jar' to 'Ubooquity.original.jar' just in case..." \
	cp /app/ubooquity/Ubooquity.jar /app/ubooquity/Ubooquity.original.jar \
	echo "Extracting 'comicreader.js' from 'Ubooquity.jar'" \
	unzip -q /app/ubooquity/Ubooquity.jar comicreader/comicreader.js \
	echo "Upping maximum image width to 4800..." \
	sed -i -e "s/IMAGE_MAX_NATIV_WIDTH\ =\ 1536/IMAGE_MAX_NATIV_WIDTH\ =\ 4800/g" comicreader/comicreader.js \
	echo "Upping preloaded images..." \
	sed -i -e "s/PRELOAD_IMG_NB\ \=\ 2/PRELOAD_IMG_NB\ \=\ 8/g" comicreader/comicreader.js \
	echo "Inserting edited 'comicreader.js' back in 'Ubooquity.jar'" \
	zip -q -u /app/ubooquity/Ubooquity.jar comicreader/comicreader.js 2>/dev/null \
	rm -rf comicreader
	echo "Finished!" \

