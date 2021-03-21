# Python

[Core Python packages for Earth Science data](http://wiki.seas.harvard.edu/geos-chem/index.php/Python_tools_for_use_with_GEOS-Chem#Core_Python_packages_for_Earth_Science_data). Using [Google Colab](https://colab.research.google.com/) or [Jupyter Notebook provided by School of GeoSciences](https://www.geos.ed.ac.uk/notebook) to learn and practice.

### Good resources to follow
1. [A Whirlwind Tour of Python](https://jakevdp.github.io/WhirlwindTourOfPython/)
2. [Python Data Science Handbook (Highly Recommended for Scientists!)](https://jakevdp.github.io/PythonDataScienceHandbook/)
3. [Scipy Lecture Notes (Highly Recommended for Scientists!)](http://scipy-lectures.org/index.html#)
4. [GEOSChem-python-tutorial](https://github.com/geoschem/GEOSChem-python-tutorial)
5. [Classic statistics: Statsmodels](https://www.statsmodels.org/stable/index.html)
6. [Bayesian statistics: PyMC](http://pymc-devs.github.io/pymc/)
7. [Spatial modelling: PyAL](http://pysal.org/documentation)
8. [xarray: N-D labeled arrays and datasets in Python (Highligh Recommended for Geoscientists!)](http://xarray.pydata.org/en/stable/index.html)
9. [Intermediate Python](https://book.pythontips.com/en/latest/#)
10. [Top 50 matplotlib Visualizations](https://www.machinelearningplus.com/plots/top-50-matplotlib-visualizations-the-master-plots-python/)
11. [Cartopy Plotting Galleries](https://mp.weixin.qq.com/s/VLRAwsNNdX7Yvnxt-JVHFA)
12. [Hands-on machine learning with scikit-learn keras and tensorflow (Highly Recommended for Scientists!)](https://www.knowledgeisle.com/wp-content/uploads/2019/12/2-Aur%C3%A9lien-G%C3%A9ron-Hands-On-Machine-Learning-with-Scikit-Learn-Keras-and-Tensorflow_-Concepts-Tools-and-Techniques-to-Build-Intelligent-Systems-O%E2%80%99Reilly-Media-2019.pdf)

### Running a stand-alone Python script
Supposing your `helloworld.py` script has the following code.
```
print("Hello World")
```
You can easily run it by typing `python helloworld.py` as long as `python` interpreter is in your `$PATH`. Alternatively, you can add the following code to the first line of the script and run it as `chmod u+x helloworld.py; ./helloworld.py`.
```
#!/exports/csce/datastore/geos/users/s1855106/miniconda/base/envs/geo/bin/python
print("Hello World")
```
The `#!` character sequence is, in fact, a special construct called a shebang. The shebang is used to tell the system the name of the interpreter that should be used to execute the script that follows. You can use `which python` to show the location of your interpreters.

