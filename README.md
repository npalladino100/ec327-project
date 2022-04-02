# ec327-project

## loading the emacs configuration
Any recent emacs distribution should work.  If you don't have emacs, install it.
If you already use emacs, backup your .emacs.d folder and your .emacs file if necessary.

Clone the repository, then create a new .emacs file and add the following lines to it:
```
(setq user-emacs-directory "<path-to-repository>/IDE/.emacs.d")
(load "<path-to-repository>/IDE/.emacs.d/init.el")

```
Restart emacs.  The first time you launch after loading the configuration, it will take some time to download the required packages.


## first implementation - basic text-editing and file navigation with partial IDE support
This implementation supports all the standard emacs text-editing features, plus file navigation support using the direx package.  Python syntax-checking and interpretation is somewhat supported.  

Keyboard Shortcuts:
Press `C-x C-j` and a popup will show the current directory, which can be navigated using the keyboard or mouse.
If you prefer to use the keyboard, use `C-x C-f` to get an interactive file navigator.
