# automated-music-conversion-script
Shell scripts to automatically convert several audio files to mp3 (using ffmpeg)

audio format: ogg,flac,aac,wma
1/ printScript.sh 
display the list of file to convert 
2/ songNumberToConvert.sh 
display the number of file to convert. 
3/ convertScript.sh 
Convert audio files. Keep the old file and add 'file'.info txt file with trace of the conversion. 
4/ displayLogs.sh 
Display the list of generated '.info' files and old converted audio files. 
5/ removeLogs.sh 
Remove generated '.info' files and old converted audio files. 
