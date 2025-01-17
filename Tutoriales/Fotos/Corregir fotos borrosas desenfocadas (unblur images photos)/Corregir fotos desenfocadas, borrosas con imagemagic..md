


Unsharp Images
[https://legacy.imagemagick.org/Usage/blur/](https://legacy.imagemagick.org/Usage/blur/)

Under Construction

Both the "-sharpen", and "-unsharp" operators, work using the exact same technique of subtracting a blur from the original image.




    convert A_blur.jpg -unsharp 0x5 A_blur_unsharp.jpg

ejemplo

     convert IMG_20220102_100055_result.jpg -unsharp 0x5 IMG_20220102_100055_ok.jpg
 




For the internal details of how both "-sharpen", and "-unsharp" actually work see Unsharpen Convolution [https://legacy.imagemagick.org/Usage/convolve/#unsharpen](https://legacy.imagemagick.org/Usage/convolve/#unsharpen)