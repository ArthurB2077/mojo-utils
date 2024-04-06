from pathlib import path, Path

fn ls_files():
    var current_dir: Path = "."
    try:
        current_dir = path.cwd()
    except:
        print("Error getting current directory")
        return None
    try:
        var files = current_dir.listdir()
        for i in range(files.__len__()):
            print(files.__getitem__(i))
    except:
        print("Error listing files in current directory")
        return None

fn main():
    ls_files()
