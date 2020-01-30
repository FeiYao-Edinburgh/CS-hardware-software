### [Installing Miniconda3 and configure geo env](https://www.wiki.ed.ac.uk/pages/viewpage.action?spaceKey=geospython&title=Managing+your+own+Python+Environment)
Assuming you want to install miniconda in `/exports/csce/datastore/geos/users/s1855106/miniconda`, the whole process is as follows.
1. Download [Miniconda3](https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh) with `curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o Miniconda3-latest-Linux-x86_64.sh`.
2. Install Miniconda3 using `bash Miniconda3-latest-Linux-x86_64.sh -p /exports/csce/datastore/geos/users/s1855106/miniconda/base`. (**NB** Allow conda init)
3. Install `geo` env using `conda env create -vv -n geo -f environment.yml`. (**NB** `conda env create` as a whole is a command whose options can be checked by using `conda env create --help`. For convenience, `environment.yml` can be downloaded from https://github.com/geoschem/GEOSChem-python-tutorial. [`environment.yml` can surely be created manually or by `conda env export > environment.yml`](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#))
4. Activate geo env with `conda activate geo` (**NB** In a later time I have defined a short-cut, `geo`, for this command).
5. (optional) Install other packages like gdal and so forth with `conda install gdal numba` or `pip install calmap` if necessary.
6. (optional) [Installing `somoclu` from the `conda-forge` channel](https://github.com/conda-forge/somoclu-feedstock) can help avoid warning when importing it, which is the case for `pip install somoclu` for the moment.
```
conda config --add channels conda-forge
conda install somoclu
```
7. Now Miniconda3 and geo env should be ready for use. When do not need geo env, `conda deactivate` (Similarly, I have defined a short-cut, `base`, for this command).

**NB** Steps 5 and 6 are optional can surely be appended to `environment.yml`. They are described here to illustrate any circumstances whenever personal use of any special packages is needed.

**NB** Upgrade `xesmf` to a higher version using `pip install --upgrade xesmf`. The higher version can regrid dataset automatically.

**NB** The above process can be largely omitted on [Eddie](https://www.wiki.ed.ac.uk/display/ResearchServices/Anaconda) since it has already provided us many versions of anaconda to use!

### Configuring .bashrc to facilitate use of holmes, rebus, eddie, [JASMIN](https://accounts.jasmin.ac.uk/), and etc.
1. Generate an SSH key pair. (a one-off effort for JASMIN use)
```
ssh-keygen -t rsa -b 2048 -C "fei.yao@ed.ac.uk" -f ~/.ssh/id_rsa_jasmin
chmod 400 ~/.ssh/id_rsa_jasmin # Might needed sometime.
```
2. Add the following commands to .bashrc stored in M drive. (a one-off effort)
```
# To conveniently log into holmes, rebus, and etc.
alias holmes='ssh s1855106@holmes.geos.ed.ac.uk'
alias rebus='ssh s1855106@rebus.geos.ed.ac.uk'
alias burn='ssh s1855106@burn.geos.ed.ac.uk'
alias eddie='ssh s1855106@eddie3.ecdf.ed.ac.uk'
alias j1='exec ssh-agent $SHELL' # This command will unload .bash_profile and hence I change to place all short-cuts into .bashrc.
alias j2='ssh-add ~/.ssh/id_rsa_jasmin'
alias jasmin='ssh -A feiyao@jasmin-login1.ceda.ac.uk'

# To conveniently log into holmes, rebus, jasmin, and etc. with port-forwarding 8999.
alias pholmes='ssh s1855106@holmes.geos.ed.ac.uk -L 8999:localhost:8999' # pholmes stands for holmes with port-forwarding, same below.
alias prebus='ssh s1855106@rebus.geos.ed.ac.uk -L 8999:localhost:8999'
alias pjasmin='ssh -L 8997:localhost:8998 -A feiyao@jasmin-login1.ceda.ac.uk -t ssh -L 8998:localhost:8999 feiyao@jasmin-sci1.ceda.ac.uk' # j1 and j2 should be run first before both jasmin and pjasmin

# To conveniently launch a jupyter notebook at port 8999.
alias jupy='jupyter notebook --NotebookApp.token='' --no-browser --port=8999'

# To conveniently switch between geo and base environment.
alias geo='conda activate geo'
alias base='conda deactivate'

# To conveniently switch between d21(holmes DataStore) and Research DataStore
# export will make HDS and RDS global environment variables and hence can be used by sub-processes launched from that Shell.
export HDS='/geos/d21/s1855106/'
export RDS='/exports/csce/datastore/geos/users/s1855106'

# auto "ls" after "cd".
alias cd=cdls
function cdls() {
# first do 'cd'
command cd $@ # 'command' ensures we use original 'cd'. $@ means all of the command-line arguments to the shell script.
nfiles=$(ls | wc -l) # how many files
if [[ $nfiles -lt 60 ]]; then # list all files if not too many
	ls
else
	ls | head -n 4
	echo $nfiles 'files in total, only list a few'
fi
}
```
3. Add the following commands to .bashrc stored on JASMIN. (a one-off effort)
```
alias geo='conda activate geo'
alias base='conda deactivate'
alias jupy='jupyter notebook --NotebookApp.token='' --no-browser --port=8999'
export GWS='/gws/nopw/j04/nceo_generic/users/feiyao'
alias cd=cdls
function cdls() {
# first do 'cd'
command cd $@ # 'command' ensures we use original 'cd'. $@ means all of the command-line arguments to the shell script.
nfiles=$(ls | wc -l) # how many files
if [[ $nfiles -lt 60 ]]; then # list all files if not too many
	ls
else
	ls | head -n 4
	echo $nfiles 'files in total, only list a few'
fi
}
```
4. Add the following commands to .bashrc stored on my personal computer. (a one-off effort)
```
alias geos='ssh s1855106@ssh.geos.ed.ac.uk'
alias pgeos='ssh -L 8996:localhost:8997 s1855106@ssh.geos.ed.ac.uk'
alias pholmes='ssh -L 8997:localhost:8998 s1855106@ssh.geos.ed.ac.uk -t ssh -L 8998:localhost:8999 s1855106@holmes.geos.ed.ac.uk'
alias prebus='ssh -L 8997:localhost:8998 s1855106@ssh.geos.ed.ac.uk -t ssh -L 8998:localhost:8999 s1855106@rebus.geos.ed.ac.uk'
alias pburn='ssh -L 8997:localhost:8998 s1855106@ssh.geos.ed.ac.uk -t ssh -L 8998:localhost:8999 s1855106@burn.geos.ed.ac.uk'
```
5. Run Jupyter Notebook in server which is at single hop distance, holmes as an example. This mostly happens in the office.
```
pholmes # office pholmes
geo
# Change to a directory where you would like work (e.g. cd $RDS/PhD-Edinburgh hence we can access all .ipynb files under $RDS/PhD-Edinburgh and its subdirectories).
jupy
# Open http://localhost:8999/ in Google-Chrome
```
6. Run Jupyter Notebook in server which is at multi hop distance, holmes as an example. This mostly happens home or when using JASMIN.
```
pholmes # home pholmes. Run j1;j2;pjasmin in the office.
geo
# Change to a directory where you would like work (e.g. cd $RDS/PhD-Edinburgh).
jupy
# Open http://localhost:8997/ in Google-Chrome
# For home pjasmin, it is a little bit tricky, see the following.
pgeos
j1
j2
pjasmin
geo
# Change to a directory where you would like work (e.g. cd $RDS/PhD-Edinburgh).
jupy
# Open http://localhost:8996/ in Google-Chrome
```
7. Monitoring the available space like the following.
```
df -H /gws/nopw/j04/nceo_generic/
du -h --max-depth=2 $GWS | sort -h` # change max-depth when needed.
```

**NB** Useful links to check: [MODIS data on CEDA](http://data.ceda.ac.uk/neodc/modis/data), [TROPOMI data on CEDA](http://data.ceda.ac.uk/neodc/sentinel5p/data), [MODIS data progress on CEDA](http://dap.ceda.ac.uk/thredds/fileServer/neodc/modis/metadata/temporal_coverage/modis.2018.html).

### Appendix A: CPU(s), Memories, and etc. of all Available Servers and Supercomputers
<table class="multi">
 <caption class="cap"></caption>
 <tr>
  <th class="title">No.</th>
  <th class="title">Name</th>
  <th class="title">IP</th>
  <th class="title">CPU(s)</th>
  <th class="title">Memories</th>
  <th class="title">java -version</th>
  <th class="title">Scratch/local spaces</th>
  <th class="title">Network spaces</th>
 </tr>
 <tr>
  <td valign="center" align='center'>1</td>
  <td valign="center" align='center'>holmes</td>
  <td valign="center" align='center'>holmes.geos.ed.ac.uk</td>
  <td valign="center" align='center'>80</td>
  <td valign="center" align='center'>503G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_222"</td>
  <td valign="center" align='center'>803G</td>
  <td valign="center" align='center' rowspan=8>39T<sup>1</sup></td>
 </tr>
 <tr>
  <td valign="center" align='center'>2</td>
  <td valign="center" align='center'>rebus</td>
  <td valign="center" align='center'>rebus.geos.ed.ac.uk</td>
  <td valign="center" align='center'>64</td>
  <td valign="center" align='center'>251G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_222"</td>
  <td valign="center" align='center'>3.5T</td>
 </tr>
 <tr>
  <td valign="center" align='center'>3</td>
  <td valign="center" align='center'>burn</td>
  <td valign="center" align='center'>burn.geos.ed.ac.uk</td>
  <td valign="center" align='center'>64</td>
  <td valign="center" align='center'>251G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_222"</td>
  <td valign="center" align='center'>1.3T</td>
 </tr> 
 <tr>
  <td valign="center" align='center'>4</td>
  <td valign="center" align='center'>achray</td>
  <td valign="center" align='center'>achray.geos.ed.ac.uk</td>
  <td valign="center" align='center'>64</td>
  <td valign="center" align='center'>251G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_232"</td>
  <td valign="center" align='center'>1.1T</td>
 </tr> 
 <tr>
  <td valign="center" align='center'>5</td>
  <td valign="center" align='center'>marple</td>
  <td valign="center" align='center'>marple.geos.ed.ac.uk</td>
  <td valign="center" align='center'>24</td>
  <td valign="center" align='center'>125G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_222"</td>
  <td valign="center" align='center'></td>
 </tr>
 <tr>
  <td valign="center" align='center'>6</td>
  <td valign="center" align='center'>poirot</td>
  <td valign="center" align='center'>poirot.geos.ed.ac.uk</td>
  <td valign="center" align='center'>24</td>
  <td valign="center" align='center'>188G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_222"</td>
  <td valign="center" align='center'></td>
 </tr>
 <tr>
  <td valign="center" align='center'>7</td>
  <td valign="center" align='center'>clouseau</td>
  <td valign="center" align='center'>clouseau.geos.ed.ac.uk</td>
  <td valign="center" align='center'>32</td>
  <td valign="center" align='center'>188G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_212"</td>
  <td valign="center" align='center'></td>
 </tr>
 <tr>
  <td valign="center" align='center'>8</td>
  <td valign="center" align='center'>renjie</td>
  <td valign="center" align='center'>renjie.geos.ed.ac.uk</td>
  <td valign="center" align='center'>96</td>
  <td valign="center" align='center'>251G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_222"</td>
  <td valign="center" align='center'></td>
 </tr>
 <tr>
  <td valign="center" align='center'>9</td>
  <td valign="center" align='center'>jasmin-sci1</td>
  <td valign="center" align='center'>jasmin-sci1.ceda.ac.uk</td>
  <td valign="center" align='center'>8</td>
  <td valign="center" align='center'>31G</td>
  <td valign="center" align='center'>java version "1.7.0_211"</td>
  <td valign="center" align='center' rowspan=8>130T<sup>2</sup></td>
  <td valign="center" align='center' rowspan=8>274T<sup>3</sup></td>
 </tr>
 <tr>
  <td valign="center" align='center'>10</td>
  <td valign="center" align='center'>jasmin-sci2</td>
  <td valign="center" align='center'>jasmin-sci2.ceda.ac.uk</td>
  <td valign="center" align='center'>8</td>
  <td valign="center" align='center'>31G</td>
  <td valign="center" align='center'>java version "1.6.0_41"</td>
 </tr>
 <tr>
  <td valign="center" align='center'>11</td>
  <td valign="center" align='center'>jasmin-sci3</td>
  <td valign="center" align='center'>jasmin-sci3.ceda.ac.uk</td>
  <td valign="center" align='center'>48</td>
  <td valign="center" align='center'>2.0T</td>
  <td valign="center" align='center'>java version "1.6.0_41"</td>
 </tr>
 <tr>
  <td valign="center" align='center'>12</td>
  <td valign="center" align='center'>jasmin-sci4</td>
  <td valign="center" align='center'>jasmin-sci4.ceda.ac.uk</td>
  <td valign="center" align='center'>8</td>
  <td valign="center" align='center'>31G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_201"</td>
 </tr>
 <tr>
  <td valign="center" align='center'>13</td>
  <td valign="center" align='center'>jasmin-sci5</td>
  <td valign="center" align='center'>jasmin-sci5.ceda.ac.uk</td>
  <td valign="center" align='center'>8</td>
  <td valign="center" align='center'>31G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_201"</td>
 </tr>
 <tr>
  <td valign="center" align='center'>14</td>
  <td valign="center" align='center'>jasmin-sci6</td>
  <td valign="center" align='center'>jasmin-sci6.ceda.ac.uk</td>
  <td valign="center" align='center'>24</td>
  <td valign="center" align='center'>377G</td>
  <td valign="center" align='center'>openjdk version "1.8.0_201"</td>
 </tr>
 <tr>
  <td valign="center" align='center'>15</td>
  <td valign="center" align='center'>cems-sci1</td>
  <td valign="center" align='center'>cems-sci1.cems.rl.ac.uk</td>
  <td valign="center" align='center'>8</td>
  <td valign="center" align='center'>31G</td>
  <td valign="center" align='center'>java version "1.7.0_211"</td>
 </tr>
 <tr>
  <td valign="center" align='center'>16</td>
  <td valign="center" align='center'>cems-sci2</td>
  <td valign="center" align='center'>cems-sci2.cems.rl.ac.uk</td>
  <td valign="center" align='center'>48</td>
  <td valign="center" align='center'>2.0T</td>
  <td valign="center" align='center'>openjdk version "1.8.0_201"</td>
 </tr>
 <tr>
 <tr>
  <td valign="center" align='center'>17</td>
  <td valign="center" align='center'>eddie</td>
  <td valign="center" align='center'>eddie3.ecdf.ed.ac.uk</td>
  <td valign="center" align='center'>16</td>
  <td valign="center" align='center'>62G</td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'>2T<sup>4</sup></td>
 </tr>
  <td valign="center" align='center'>18</td>
  <td valign="center" align='center'>LOTUS<sup>5</sup></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
 <td valign="center" align='center'></td>
 </tr>
 <tr>
  <td valign="center" align='center'>19</td>
  <td valign="center" align='center'>EDDIE<sup>6</sup></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
  <td valign="center" align='center'></td>
 </tr>
</table>
Comments: <sup>1</sup> 39T mainly in '/d21' but not too much left. <sup>2</sup> 130T will be improved to 250T during JASMIN Phase 4 (http://www.jasmin.ac.uk/phase4/#scratch). <sup>3</sup> Like <sup>1</sup>, mainly in '/gws/nopw/j04/nceo_generic', not too much left but should be enough for me. <sup>4</sup> Will be auto-matically deleted if files are older than 1 month. <sup>5</sup> Supercomputers UoE provided. <sup>6</sup> Supercomputers RAL provided.

**NB** Tranfering data from and to JASMIN should rely on [JASMIN high-performance data transfer service like jasmin-xfer1.ceda.ac.uk](https://help.jasmin.ac.uk/article/221-jasmin-external-connections)


### Appendix B: Path of several network drives in School of GeoSciences, The University of Edinburgh
<table class="multi">
 <tr>
  <td valign="center" align='center'>Name</td>
  <td valign="center" align='center'>Windows Path</td>
  <td valign="center" align='center'>Linux Path</td>
 </tr>
 <tr>
  <td valign="center" align='center'>U drive</td>
  <td valign="center" align='center'>\\ed.ac.uk\dst\shared</td>
  <td valign="center" align='center'></td>
 </tr>
 <tr>
  <td valign="center" align='center'>G drive</td>
  <td valign="center" align='center'>\\students.geos.ed.ac.uk\netdata</td>
  <td valign="center" align='center'></td>
 </tr>
 <tr>
  <td valign="center" align='center'>R drive</td>
  <td valign="center" align='center'>\\csce.datastore.ed.ac.uk\csce\geos\users\s1855106</td>
  <td valign="center" align='center'>/exports/csce/datastore/geos/users/s1855106</td>
 </tr>
 <tr>
  <td valign="center" align='center'>M drive</td>
  <td valign="center" align='center'>\\students.geos.ed.ac.uk\s1855106</td>
  <td valign="center" align='center'>/home/s1855106</td>
 </tr>
</table>
