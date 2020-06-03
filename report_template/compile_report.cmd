set build_dir=build
set file_name=report_template
if exist %build_dir% ( echo exist ) else ( mkdir %build_dir% )
cd %build_dir%
xelatex ../%file_name%
bibtex %file_name%
xelatex ../%file_name%
xelatex ../%file_name%
