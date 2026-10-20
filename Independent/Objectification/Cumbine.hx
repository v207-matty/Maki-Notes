import haxe.io.Path;
import sys.FileSystem;

class Cumbine {

    static function readDir(d:String)
    {
        var files:Array<String> = [];
        d = Path.removeTrailingSlashes(d);

        for (file in FileSystem.readDirectory(d))
        {
            var p = '$d/$file';

            files.push(p);
        }
    }

    static function main() {
        
    }
}