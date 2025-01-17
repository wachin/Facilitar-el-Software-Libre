

ffmpeg -i FileName.mp4 -c copy -map 0 -segment_time 00:00:01 -f segment -reset_timestamps 1 'output%03d.mp4'

ffmpeg -i FileName.mp4 -acodec copy -f segment -segment_time 30 -vcodec copy -reset_timestamps 1 -map 0 FileName%d.mp4

ffmpeg -i FileName.mp4 -map 0 -f segment -segment_time 60 -reset_timestamps 1 -c copy output_%03d.mp4


ffmpeg -i 20220724_130445_mencoder.mp4 -acodec copy -f segment -segment_time 30 -vcodec copy -reset_timestamps 1 -map 0 FileName%d.mp4


    ffmpeg -i ~20220724_125729.mp4 -c copy -map 0 -segment_time 00:00:30 -f segment -reset_timestamps 1 'output%03d.mp4'
    
    
    ffmpeg -i VID-20220724-WA0011.m4v -c copy -map 0 -segment_time 00:00:30 -f segment -reset_timestamps 1 'output%03d.m4v'
    ffmpeg -i VID-20220724-WA0011.vob -c copy -map 0 -segment_time 00:00:29 -f segment -reset_timestamps 1 'output%03d.vob'
    ffmpeg -i VID-20220724-WA0011.mov -c copy -map 0 -segment_time 00:00:27 -f segment -reset_timestamps 1 'output%03d.mov'
    ffmpeg -i 20220724_125729.ogg -c copy -map 0 -segment_time 00:00:29 -f segment -reset_timestamps 1 'output%03d.ogg'
    
    
        ffmpeg -i 20210930.mp4 -c:v libx264 -crf 22 -map 0 -segment_time N -reset_timestamps 1 -g XX -sc_threshold 0 -force_key_frames “expr:gte(t,n_forced*N)” -f segment output%03d.mp4 



    ffmpeg -i ~20220724_125729.mp4 -c copy -map 0 -segment_time 00:00:30 -f segment -reset_timestamps 1 'output%03d.mp4'
    
    avconv -i "${FILE}" -ss -t 60 -c:v copy -c:a copy "./${FILE}-chop/${COUNT} - ${FILE}"
    
    
    
    for i in $( seq 50 );
    do ffmpeg -i 20210930.mp4 -sameq -ss 00:`expr $i \* 2 - 2`:00 -t 00:02:00 20210930_ok.mp4; done



How to post a long video in WhatsApp status – Simple Method | Naveen's Blog
https://www.naveen.info/how-to-post-a-long-video-in-whatsapp-status/3413/


