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