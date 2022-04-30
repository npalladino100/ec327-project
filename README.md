# ec327-project

## loading the emacs configuration
Any recent emacs distribution should work.  If you don't have emacs, install it.
If you already use emacs, backup your .emacs.d folder and your .emacs file if necessary.

Clone the repository, then create a new .emacs file and add the following lines to it:
```
(setq user-emacs-directory "~/ec327-project/IDE/.emacs.d") ;; path to the repository


(setq user-conda-directory "~/anaconda3") ;; path to anaconda installation
(setq user-conda-env-directory "~/anaconda3/envs") ;; path to anaconda environments
(setq user-conda-env-name "elpy") ;; name of anaconda environment (leave as "elpy" if you set up the environment with "createenv.sh")

(setq custom-file (concat user-emacs-directory "/src/custom.el")) ;; path to customization file
(load custom-file)

(setq user-home-directory "~") ;; default working environment (where you want shell/file navigator to start in)
(load (concat user-emacs-directory "/init.el"))  ;; leave unchanged


```
Restart emacs.  The first time you launch after loading the configuration, it will take some time to download the required packages.

### setting up python and anaconda
If you already have anaconda installed, make sure the paths from the .emacs file match your installation and environment paths.  You can change the "elpy" environment name to an existing environment if you have one, or you can run the createenv.sh script in the root of the repository to generate an environment called "elpy".

### Toolbar
Press `C-x C-x` to open the toolbar.  Click on one of the options, or press its corresponding key.

Here are some of the toolbar options:
#### Terminal
Opens an emulated shell at the current working directory with support for linux commands like "ls".
#### Open File
Opens the file navigator at the current working directory.  Click on a file to open it.
#### Compile
Automatically detects programming language, compiles the buffer if it has a .java extension, or runs it using IPython if the extension is .py.
#### Run
Runs java programs or python scripts.

### file navigation and editing (these are default emacs keybindings)
Press `C-x C-f` to open a file or create a new file.

Press `C-x o` to switch windows.  If there are more than two windows, each will have a numbered label and pressing the corresponding number on your keyboard switches the cursor to that window.

Press `C-x b` to switch buffers.  You can type the name of the buffer and it will open in the current window.

Press `C-x 0` to close a window.

Press `C-x k` to kill the current buffer.

Press `C-x 2` to split the window vertically.

Press `C-x 3` to split the window horizontally.

Press `C-x C-s` to save a file.
