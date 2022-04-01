# ec327-project

## loading the emacs configuration
If you don't have it already, install any flavor of emacs.
If you already use emacs, backup your .emacs.d folder and your .emacs file if necessary.

Clone the repository, then create a new .emacs file and add the following lines to it:
```
(setq user-emacs-directory "<path-to-repository>/IDE/.emacs.d")
(load "<path-to-repository>/IDE/.emacs.d/init.el")

```
Restart emacs and enjoy

P.S. The first time you launch emacs after loading the configuration, it will take some time to download the required packages.


## first implementation - basic text-editing and file navigation
This implementation supports all the standard emacs text-editing features, plus file navigation support using the direx package.  Try it out by pressing `C-x C-j` and a popup will show the current directory, which can be navigated using the keyboard or mouse.
