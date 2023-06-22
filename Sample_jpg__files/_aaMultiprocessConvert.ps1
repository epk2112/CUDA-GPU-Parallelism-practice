Measure-Command{
# Get all the jpg files in the current directory
$jpgFiles = Get-ChildItem -Path . -Filter *.jpg

# Perform a ForEach-Object parallel loop on the jpg files
$jpgFiles | ForEach-Object -Parallel {
    magick mogrify -path "C:\Users\Administrator\Pictures\Test Samples\destin" -resize 500 -format png "C:\Users\Administrator\Pictures\Test Samples\$($_.Name)"
    Write-Host "Converted $($_.Name) to png"
}
}
