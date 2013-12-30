essmsh c:\perl\Security\Auto.mxl

setlocal EnableDelayedExpansion
set filenames[0]=Users
set filenames[1]=Groups
set filenames[2]=UserGroups
set filenames[3]=UserPriv
set filenames[4]=GroupPriv

for /L %%i in (0,1,4) do (
perl c:\perl\Security\!filenames[%%i]!.pl c:\perl\Security\!filenames[%%i]!.txt > c:\perl\Security\!filenames[%%i]!.mxl
)


