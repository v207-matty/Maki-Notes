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
		var cumbofile = '#season1 #objectification\n\n# Objectification\n\n';

		var dir = readDir('.');
		dir.sort((a, b) -> return 1);

		for (file in dir) {
			var path = new Path(file);

			if (path.ext != 'md' || path.file == 'README' || path.file == 'Cumbo' || path.dir.startsWith('./Tales/'))
				continue;

			cumbofile += '## ${path.file}\n\n${File.getContent(file).replace('# ', '## ')}\n\n';
		}

		File.saveContent('Cumbo.md', cumbofile);
	}
}
