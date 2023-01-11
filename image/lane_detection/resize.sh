### This is for resizing the input frame to a mjpeg-tool-friendly size - both width and height need to be multiply of 16

#sudo apt-get install imagemagick (already installed)

#convert -resize 1024X368 input_frames/00000.jpg input_frames_resized/00000.jpg

#To force convert image to specified size regardless of original size, use !
# convert -resize 1024X368! input_frames/00030.jpg input_frames_resized/00001.jpg

