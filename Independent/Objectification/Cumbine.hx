import haxe.io.Path;
import sys.FileSystem;

class Cumbine {

    static function readDir(d:String)
    {
        var files:Array<String> = [];
        d = Path.removeTrailingSlashes(d);

        for (file in FileSystem.readDirectory(d))
        {
            files.push('$d/$file');
        }
    }

    static function main() {
        
    }
}