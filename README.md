# ps2exe_dumper

Very basic tool written in D to dump the PowerShell script from an executable that was built with ps2exe. This is for cases when the -extract feature was removed, you don't want to run the executable, or you're not on Windows. There aren't any good checks on what kind of executable/object is fed, so use with caution.
