import haxe.io.Path;
import sys.FileSystem;

class Cumbine {
	static function readDir(d:String):Array<String> {
		var files:Array<String> = [];
		d = Path.removeTrailingSlashes(d);

		for (file in FileSystem.readDirectory(d)) {
			var p = '$d/$file';

			if (FileSystem.isDirectory(p))
				for (subfile in readDir(p))
					files.push(subfile);
			else
				files.push(p);
		}

		return files;
	}

	static function main() {
        var cumbofile = '';
    }
}
