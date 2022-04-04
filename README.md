# ec327-project

## loading the emacs configuration
Any recent emacs distribution should work.  If you don't have emacs, install it.
If you already use emacs, backup your .emacs.d folder and your .emacs file if necessary.

Clone the repository, then create a new .emacs file and add the following lines to it:
```
(setq user-emacs-directory "<path-to-repository>/IDE/.emacs.d")
(load "<path-to-repository>/IDE/.emacs.d/init.el")
(venv-initialize-interactive-shells) ;; if you want python support
(venv-initialize-eshell) ;; if you want python support
(setq conda-env-home-directory (expand-file-name "~/anaconda3/")) ;; default anaconda path (for python support)
(custom-set-variables '(conda-anaconda-home "~/anaconda3/")) ;; default anaconda path (for python support)
(setq venv-location '("~/anaconda3/envs/<name-of-environment>")) ;; path to an anaconda environment (for python support)
(venv-workon "<name-of-environment>") ;; name of anaconda environment (for python support)

```
Restart emacs.  The first time you launch after loading the configuration, it will take some time to download the required packages.


## first implementation - basic text-editing and file navigation with partial IDE support
This implementation supports all the standard emacs text-editing features, plus file navigation support using the direx package.  Python syntax-checking and interpretation is somewhat supported.  Anaconda is supported, but lines 219-222 of the init.el file need to be modified to point to the path of an anaconda virtual environment (this will be automated later).

Keyboard Shortcuts:
Press `C-x C-j` and a popup will show the current directory, which can be navigated using the keyboard or mouse.

If you prefer to use the keyboard, use `C-x C-f` to get an interactive file navigator.

When you are editing a python script, you can press `C-c C-c` to execute the script.  The output will be displayed in a separate buffer, which you can switch to using `C-c C-z`.

In a python script, put your cursor on something and press `C-c C-d` to display documentation, and pressing `q` will close the documentation buffer.
