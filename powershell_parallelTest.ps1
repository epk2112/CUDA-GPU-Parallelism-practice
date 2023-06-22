$timeTaken = Measure-Command {
    # Get all the jpg files in the directory 'Sample_jpg__files'
    $jpgFiles = Get-ChildItem -Path Sample_jpg__files -Filter *.jpg
    
    # Create the destination directory if it doesn't exist
    $destDir = "final_png__files"
    if (!(Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir
    }
    
    # Perform a ForEach-Object parallel loop on the jpg files
    $jpgFiles | ForEach-Object -Parallel {
        # Import external variables into the parallel loop
        $destDir = $using:destDir

        # Convert the jpg file to png using ImageMagick
        convert $_.FullName "$destDir/$($_.BaseName).png"
        
        Write-Host "Converted $($_.Name) to png"
    }
    }

Write-Host "Time taken: $($timeTaken.Seconds) seconds"