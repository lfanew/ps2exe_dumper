import std.array : split;
import std.conv;
import std.file : exists, read, write;
import std.stdio : writeln;
import std.string : format;

static immutable size_t SCRIPT_OFFSET = 0x2e7f;

void main(string[] args)
{
	if (args.length <= 1)
	{
		writeln("Provide a ps2exe file as an argument");
		return;
	}

	auto path = args[1];
	auto pathWithoutExtension = path.split('.')[0];
	if (!exists(path))
	{
		writeln(path, " does not exist");
		return;
	}

	char[] bytes = cast(char[]) read(path);
	if (bytes.length <= SCRIPT_OFFSET)
	{
		writeln("Input file does not seem to be a ps2exe file");
		return;
	}
	char* cs = bytes.ptr + SCRIPT_OFFSET;
	auto s = to!string(cs);
	write(format("%s.ps1", pathWithoutExtension), s);
}
