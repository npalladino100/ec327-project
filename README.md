# ec327-project

## loading the emacs configuration
Any recent emacs distribution should work.  If you don't have emacs, install it.
If you already use emacs, backup your .emacs.d folder and your .emacs file if necessary.

Clone the repository, then create a new .emacs file and add the following lines to it:
```
(setq user-emacs-directory "<path-to-repository>/IDE/.emacs.d")
(load "<path-to-repository>/IDE/.emacs.d/init.el")

;; Optional lines for anaconda/python support
;; Change these lines if your anaconda installation or environments are in different locations
(setq user-conda-directory "~/anaconda3")
(setq user-conda-env-directory "~/anaconda3/envs")
(setq user-conda-env-name "elpy")
(load (concat user-emacs-directory "/init-pyvenv.el")) ;; doesn't need to be changed

```
Restart emacs.  The first time you launch after loading the configuration, it will take some time to download the required packages.


## first implementation - basic text-editing and file navigation with partial IDE support
This implementation supports all the standard emacs text-editing features, plus file navigation support using the direx package.  Python syntax-checking and interpretation is somewhat supported.  Anaconda is supported, but the .emacs file needs to point to the path of an anaconda virtual environment (using the optional lines above).

### File Navigation
Press `C-x C-j` and a popup will show the current directory, which can be navigated using the keyboard or mouse.

If you prefer to use the keyboard, use `C-x C-f` to get an interactive file navigator.

You can create/navigate windows and buffers using standard emacs commands.

### Python (with Anaconda)

When you are editing a python script, you can press `C-c C-c` to execute the script.  The output will be displayed in a separate buffer, which you can switch to using `C-c C-z`.

In a python script, put your cursor on something and press `C-c C-d` to display documentation, and pressing `q` will close the documentation buffer.

### Java
When you are editing a python script, you can press `C-c C-j C-c` to compile the script in a terminal.  While in the terminal, you can press `C-c C-j C-r` to run the last-compiled script.
