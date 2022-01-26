@ECHO OFF
call set host=%%COMPUTERNAME:-= %%
for /f "tokens=2" %%G IN ( "%host%" ) DO set host=%%G
powershell -Command "(gc C:\svn\Mounts\DockerConfigs\trunk\adminsync.entrata.lcl.conf) -replace 'trunk\.', '"%host%".' | Out-File .\adminsync.entrata.lcl.conf"