####### jpeg2yuv ####### 

### Print instructions for programs:
# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/readMemVal/obj-intel64/print_ins_in_rtn.so -o print_ins_decode_jpeg_raw -rtn_name_to_parse decode_jpeg_raw -- jpeg2yuv -f 25 -I p -j input_frames_resized_1img/%05d.jpg | yuv2lav -f a -q 80 -o transistion.avi

### Print every read instruction and memory value:
#Post-process in count_diff_lines.py
# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/readMemVal/obj-intel64/read_memval_ins.so -o read_memval_ins_img1 -- jpeg2yuv -f 25 -I p -j input_frames_resized_img1/%05d.jpg | yuv2lav -f a -q 80 -o transistion.avi
# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/readMemVal/obj-intel64/read_memval_ins.so -o read_memval_ins_img2 -- jpeg2yuv -f 25 -I p -j input_frames_resized_img2/%05d.jpg | yuv2lav -f a -q 80 -o transistion.avi

### Print procedure counts
# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/ManualExamples/obj-intel64/proccount.so -- jpeg2yuv -f 25 -I p -j input_16X16/lane%d.jpg > lane.yuv

####### mpeg2enc ####### 

# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/ManualExamples/obj-intel64/proccount.so -- mpeg2enc jpeg2yuv_1img.yuv -o mpegfile.m1v
    ## output in proccount.out.mjpg2enc_fullimg
# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/readMemVal/obj-intel64/write_out_trace.so -trace trace_mpeg2enc_1img_fdct_ref -o write_out_trace_mpeg2enc_1img_idct_ref -rtn_name_to_parse idct_ref -- mpeg2enc jpeg2yuv_1img.yuv -o mpegfile.m1v
# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/readMemVal/obj-intel64/write_out_trace.so -trace trace_mpeg2enc_1img_libmpeg2encpp -o write_out_trace_mpeg2enc_1img_libmpeg2encpp -rtn_name_to_parse libmpeg2encpp -- mpeg2enc jpeg2yuv_1img.yuv -o mpegfile.m1v


################ mpeg2enc small image
# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/ManualExamples/obj-intel64/proccount.so -- mpeg2enc input_16X16/test.yuv -o input_16X16/test.m1v
# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/readMemVal/obj-intel64/write_out_trace.so -trace trace_mpeg2enc_smallimg2_idct_ref -o input_16X16/write_out_trace_mpeg2enc_smallimg2_idct_ref -rtn_name_to_parse idct_ref -- mpeg2enc input_16X16/test.yuv -o input_16X16/test.m1v
# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/readMemVal/obj-intel64/write_out_trace.so -trace whiteimg/trace_mpeg2enc_blackimg2_idct_ref -o whiteimg/write_out_trace_mpeg2enc_blackimg2_idct_ref -rtn_name_to_parse idct_ref -- mpeg2enc whiteimg/black.yuv -o whiteimg/black.m1v


# /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/readMemVal/obj-intel64/write_out_trace.so -trace input_16X16/trace_jpeg2yuv_smallimg2_decode_jpeg_raw -o input_16X16/write_out_trace_jpeg2yuv_smallimg2_decode_jpeg_raw -rtn_name_to_parse decode_jpeg_raw -- jpeg2yuv -f 25 -I p -j input_16X16/lane%d.jpg > lane.yuv

