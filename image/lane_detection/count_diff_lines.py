# This script counts the number of differences in values loaded by two programs. In current use case, the same program takes two different inputs: first time the 1st image and 2nd time the 2nd image. The two images are taken from adjacent frames of a self-driving training set. 
#Results are similar to merely counting the differences of pixels. The number of same (similar) loaded values are slightly larger than counting the pixels because there might repetitive loads and non-pixel loads.

#### Results:
# ('no diff: ', 156762, 'percent: ', 11.79)
# ('diff < 5: ', 639623, 'percent: ', 48.12)
# ('diff < 10: ', 850469, 'percent: ', 63.98)

## See pin.sh for generating raw files from read_memval_ins pintool:
#Command:
#/home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/pin -t /home/haiyue/research/value_prediction/pin-3.24-98612-g6bd5931f2-gcc-linux/source/tools/readMemVal/obj-intel64/read_memval_ins.so -o read_memval_ins_img1 -- jpeg2yuv -f 25 -I p -j input_frames_resized_img1/%05d.jpg | yuv2lav -f a -q 80 -o transistion.avi
#same for img2

import re
import numpy as np
#Define the search term:
pattern = r"Size: 1	Value:(.*)" #pattern must be enclosed in quotes

def read_file(filename):
    data = []
    for line in open(filename):
        if line !='':
            word = re.search(pattern, line)
            if (word != None):
                i = int(str(word.group(1)), 16)
                data.append(i) 
    return data

readval1 = read_file("read_memval_ins_img1")
readval2 = read_file("read_memval_ins_img2")
## cut longer array to make array sizes match
readval1 = readval1[:len(readval2)]

diff = np.absolute(np.array(readval1) - np.array(readval2))
sum = float(len(diff))
diff0 = np.sum(diff==0)
diff5 = np.sum(diff<5)
diff10 = np.sum(diff<10)
print(sum)
print("======Difference between two images: counting each R/G/B individually======")
print("no diff: ", diff0, "percent: ", round(100*(diff0/sum), 2))
print("diff < 5: ", diff5, "percent: ", round(100*(diff5/sum), 2))
print("diff < 10: ", diff10, "percent: ", round(100*(diff10/sum), 2))
