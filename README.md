# LaTeX - PythonTeX
## Description
This is a template for using PythonTeX with LaTeX. This can be used to create a report or a presentation by mixing LaTeX and Python code. The Python code is executed when the LaTeX document is compiled. The output of the Python code is then inserted into the LaTeX document. This allows for the creation of dynamic LaTeX documents.
## Requirements
* LaTeX
* Python
* PythonTeX (Can already be installed with some distributions of LaTeX, such as TeXLive or MiKTeX)
I did not test this on Windows. It should work, as the PythonTeX documentation states that it is compatible with Windows, specially with MiKTeX. Make sure to have PythonTeX installed. 

You can find more information about the installation of PythonTeX [here](https://www.mathweb.fr/euclide/pythontex/#Installation_de_PythonTeX).

Otherwise, if you used a WSL already, I recommend you to use it for this.

## Usage

### Run Python code
To compile some Python code, you can use the following command:
```latex
\begin{pycode}
# Python code
# ...
\end{pycode}
```
This will just execute the Python code. You can use the Python function `print()`.

Otherwise, you can use the following command to execute some Python code without creating a specific block for it:
```latex
\pyc{# Python code}
```
### Run and insert Python code
To execute some Python code and insert it in the LaTeX document, you can use the following command:
```latex
\begin{pyconsole}
result = 0
for i in range(10):
    result += i

print("result =", result)
# Make sure to add a blank line at the 
# end of the python code, specially if you use a for loop.
\end{pyconsole}
```


This will add this result in the LaTeX document:
```Python
>>> result = 0
>>> for i in range(10):
... result += i
...
>>> print("result =", result)
result = 45
>>> # Make sure to add a blank line at the
>>> # end of the python code, specially if you use a for loop.
```
Notes : The `pyconsole` and `pycode` are differents environments. So if you execute a Python code in the `pyconsole` environment, the variables, functions, etc. will not be available in the `pycode` environment. You'll need to execute the code again in the `pycode` environment. 

### Insert Python code
If you want to insert some Python code in the LaTeX document without executing it, you can use the following command:
```latex
\begin{pyverbatim}
# Python code
# ...
\end{pyverbatim}
```
### Execute external Python script
If you want to execute an external Python script, you can use the following command:
```latex
\pyc{exec(open('sources/script.py').read())}
```
Notes : If in the script you run some functions that use path to files, make sure that the access to the files is relative to the LaTeX document you're importing the script in. Otherwise, you'll need to use absolute path.

### Show plots
If you want to show plots in the LaTeX document, you can use the following command:
```latex
\begin{pycode}
import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 2*np.pi, 100)
y = np.sin(x)
# ...
plt.plot(x, y)
plt.savefig('img/plot.png',bbox_inches='tight')
\end{pycode}


\includepythongraphics{img/plot.png}
```
Make sure to use the special command `\includepythongraphics{} ` to include the plot in the LaTeX document.

## Compilation
### Makefile
For the compilation, I made a Makefile to simplify the process. You can use the following command to compile the LaTeX document:
```bash
make
```

If you want to clean the directory, you can use the following command:
```bash
make clean
```

Make sure to modify the Makefile if you want to change the name of the LaTeX document and if you're using a different LaTeX compiler.
### Others
It might be possible to compile the LaTeX document mixed with Python using MiKTeX 

