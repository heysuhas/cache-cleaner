# Cache Cleaner

Tired of your computer feeling sluggish and running out of space? Fear not, lazy folks! This script is here to do the dirty work for you, so you can sit back and enjoy a fresh, speedy computer without lifting a finger. In short, Cache-cleaner is a handy batch script for Windows that helps you get rid of all those pesky temporary files and event logs cluttering up your system.


## What the Script Does

The Cache Cleaner script performs the following tasks:

1. Deletes temporary files from the Windows temp folder (`%SystemRoot%\Temp\`).
2. Deletes prefetch files (`%SystemRoot%\Prefetch\`).
3. Deletes user temp files (`%Temp%\`).
4. Deletes temporary Internet Explorer files (`%UserProfile%\AppData\Local\Microsoft\Windows\Temporary Internet Files` and `%UserProfile%\AppData\Local\Microsoft\Windows\INetCache`).
5. Clears all event logs.

## How to Use

1. Download the `cache_cleaner.bat` file from the repository.
2. Right-click on the file and select "Run as administrator". This script requires administrative privileges to run.
3. The script will display the list of actions it will perform and ask you to confirm by pressing any key.
4. Once confirmed, the script will start the cleaning process and show a progress bar indicating the completion percentage.
5. After the cleaning process is completed, the script will display a message "Cache cleaning completed successfully!"

**Note:** It's always a good practice to create a system backup before running any script that modifies system files or settings.

## Contributing

Contributions are always welcome! If you want to contribute to this project, feel free to:

1. Fork the repository
2. Make your changes
3. Create a pull request


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
