# equi2pano

This script allows for easy ingestion of existing spherical panorama timelapse images into a [pano-moments input files](https://www.panomoments.com/). In particular, convert 120+ equirectangular files into pano-moment compatible files (half sized equirectangular files). The file names should not contain any spaces for the script to work.

```bash
# usage
equi2pano.sh /your_equirectangular_files/ /your_output_dir/
```

Keep in mind that for static timelapse movies (fixed position) you will lose the parallax effect as advertised. Combining a 360 camera with the pano-moments rig will however preserve this quality.

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">VR needs a fun creative medium: 
<a href="https://twitter.com/hashtag/PanoMoments?src=hash">#PanoMoments</a> - Easy to capture with motion parallax for more immersion - <a href="https://t.co/wbfyHCPDEl">https://t.co/wbfyHCPDEl</a>
<br>
<img src="https://files.panomoments.com/media/RotatingSquare.gif"></src>
<br>
&mdash; Pano Moments (@PanoMoments)
<a href="https://twitter.com/PanoMoments/status/783300151750303744">October 4, 2016</a>
</blockquote>

You can alter the convert command in the script to adjust the field-of-view in order to use the 180 degree offset view instead. Unlike conventional cameras which only allow a singular view direction, 360 spherical cameras record the whole scene and allow for this creative freedom.

More information and demo's can be found on the Pano Moments website:

[https://www.panomoments.com/](https://www.panomoments.com/)

DISCLAIMER: I'm not affiliated with the project but only provide this tool for easy processing!
