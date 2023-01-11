### Different test cases from mjpeg tools
# jpeg2yuv -f 25 -I p -j ../image/lane_detection/input_frames_resized_1img/%05d.jpg | yuv2lav -f a -q 80 -o ../image/lane_detection/transistion.avi
# jpeg2yuv -f 25 -I p -j input_frames_resized_2img/%05d.jpg | mpeg2enc -o mpegfile.m1v
jpeg2yuv -f 25 -I p -j input_frames_resized_img1/%05d.jpg > jpeg2yuv_1img.yuv
# mpeg2enc jpeg2yuv_1img.yuv -o mpegfile.m1v