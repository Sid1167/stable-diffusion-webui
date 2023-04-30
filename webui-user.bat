@echo off

::set PYTHON=C:\ProgramData\Anaconda3\envs\image_generation\python.exe
:: it must be python 3.10 to work properly
set PYTHON=C:\Python310\python.exe
set GIT=
set VENV_DIR=
:: the hide-ui-dir-config is separate flag, hides server-side
:: set COMMANDLINE_ARGS=--theme dark --ui-settings-file=config-af.json --hide-ui-dir-config
:: for my laptop
set COMMANDLINE_ARGS=--theme dark --ui-settings-file=config-af.json --hide-ui-dir-config --ui-config-file=ui-config-ntb.json
::set COMMANDLINE_ARGS=--theme dark --ui-settings-file=config.json --ui-config-file=ui-config-default.json
::set COMMANDLINE_ARGS=--theme dark --medvram
::set COMMANDLINE_ARGS=--theme dark --lowvram
::set COMMANDLINE_ARGS=--theme dark --use-cpu all --no-half


call webui.bat
