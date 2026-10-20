import sys.FileSystem;

class Cumbine {

    static function readDir(d:String)
    {
        for (file in FileSystem.readDirectory(d))
        {
            files.push(file);
        }
    }

    static function main() {
        
    }
}