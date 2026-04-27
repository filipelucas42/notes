# ffmpeg

## concatenate videos
```
$ cat mylist.txt
file '/path/to/file1'
file '/path/to/file2'
file '/path/to/file3'
    
$ ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4
```

## convert video
`ffmpeg -i LostInTranslation.mkv -codec copy LostInTranslation.mp4`

`ffmpeg -i "input.mkv" -vn -c:a libmp3lame -q:a 2 "output.mp3"`

## reduce image size
`ffmpeg -i input.jpg -q:v 10 output.jpg`

## cut audio file
`ffmpeg -ss 0 -i <input_file>.mp3 -t 300 -c copy <output_file>.mp3`
- Start at 0
- Does a 300 seconds cut