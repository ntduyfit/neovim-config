" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont JetBrainsMono Nerd Font:h14
    GuiLinespace 8

endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 1
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 1
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 1
endif
