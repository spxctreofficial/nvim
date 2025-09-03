return {
    "frabjous/knap",
    event = "VeryLazy",
    opts = {
        htmloutputext = "html",
        htmltohtml = "none",
        htmltohtmlviewerlaunch = "chromium %outputfile%",
        htmltohtmlviewerrefresh = "none",
        mdoutputext = "pdf",
        mdtohtml = "pandoc --standalone %docroot% -o %outputfile%",
        mdtohtmlviewerlaunch = "chromium %outputfile%",
        mdtohtmlviewerrefresh = "none",
        mdtopdf = "pandoc %docroot% -o %outputfile%",
        mdtopdfviewerlaunch = "zathura %outputfile%",
        mdtopdfviewerrefresh = "none",
        markdownoutputext = "pdf",
        markdowntohtml = "pandoc --standalone %docroot% -o %outputfile%",
        markdowntohtmlviewerlaunch = "chromium %outputfile%",
        markdowntohtmlviewerrefresh = "none",
        markdowntopdf = "pandoc %docroot% -o %outputfile%",
        markdowntopdfviewerlaunch = "zathura %outputfile%",
        markdowntopdfviewerrefresh = "none",
        texoutputext = "pdf",
        textopdf = "pdflatex -interaction=batchmode -halt-on-error -synctex=1 %docroot%",
        textopdfviewerlaunch =
        "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
        textopdfviewerrefresh = "none",
        textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
        delay = 10
    },
    config = function(_, opts)
        vim.g.knap_settings = opts

        local knap = require('knap')

        vim.keymap.set({ 'n', 'v', 'i' }, '<F5>', function()
            knap.process_once()
        end)

        vim.keymap.set({ 'n', 'v', 'i' }, '<F6>', function()
            knap.close_viewer()
        end)

        vim.keymap.set({ 'n', 'v', 'i' }, '<F7>', function()
            knap.toggle_autopreviewing()
        end)
    end
}
