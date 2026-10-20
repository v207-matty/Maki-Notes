import sys.io.File;
import haxe.io.Path;
import sys.FileSystem;

using StringTools;

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

		for (file in readDir('.')) {
			var path = new Path(file.substr(1));

			if (path.ext != 'md')
				continue;
			if (path.file == 'README')
				continue;
			if (path.file == 'Cumbo')
				continue;

			cumbofile += '# ${path.file}\n\n${File.getContent(file)}\n';
		}

		File.saveContent('Cumbo.md', cumbofile);
	}
}
